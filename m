Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U2ltA-0005vQ-Ce
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 18:00:58 +0100
Received: from mail-da0-f72.google.com ([209.85.210.72])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 05 Feb 2013 08:45:05 -0800
Received: by mail-da0-f72.google.com with SMTP id r28so214401daj.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2013 08:45:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=p0EIW/Ly9/21pKk9XDojfwiKGYXYSwJqROsMiuQb13M=;
	b=PkoLLsvF9f0L1U6ndpEMSi4uUbktRBHG9B8BnWaF6M0msq2+0WfOsyBRtUl2ljeOVu
	wuyZ5yUh6Ei2r484+8bAjk8psp0Ebs6ty71aUOREoGymzLwIQTs+Mi+Bd+aR3DaoYq+N
	3AzLqrF4FlLC7jtzAEtfrZyIpX1c9Fo+i1vVNGgjiPIDZxgQjiGLItr5xImI1JgFMDbb
	5v9NoS3uUkM4eEBXcx+gbqA+sS0vsU9ey8cfQl+mcKwaZPltTnOxuxLD4379WRhk4YF5
	WEaqwWyaVwmt7xAKAfZfyNOK5fDNvTfWkTYilHT5J0nWL6W8158ct/sozkIiX5fhg7vF
	P+wA==
X-Received: by 10.66.72.201 with SMTP id f9mr66056441pav.38.1360082704693;
	Tue, 05 Feb 2013 08:45:04 -0800 (PST)
X-Received: by 10.66.72.201 with SMTP id f9mr66056423pav.38.1360082704542;
	Tue, 05 Feb 2013 08:45:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.66.193.225 with HTTP; Tue, 5 Feb 2013 08:44:43 -0800 (PST)
In-Reply-To: <3666e39a359b03ba1e054813f4353ddeed11d506.1360079373.git.rep.dot.nop@gmail.com>
References: <cover.1360079373.git.rep.dot.nop@gmail.com>
	<3666e39a359b03ba1e054813f4353ddeed11d506.1360079373.git.rep.dot.nop@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 5 Feb 2013 16:44:43 +0000
Message-ID: <CAJTo0LYDkCvZUCp4U4o_2bsmuiVor69Wbh4Rd94g3WvQ4=X5Yw@mail.gmail.com>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
X-Gm-Message-State: ALoCoQkKdhyN6CZN4C5Qa5F7erzjuyvmCljYPx/J8xAnsbgsMQrI+B6Tg2EJqguZSIhJncAj2sBINIB2phpI+1aU1/ARN6/lqG5m7mV2WE7c0wvwNeuGJ+xMgZmchky7sYW/IHcT+1HNJGY7EJo/78xXCHQy8DuSNbJWbfrhltS5acIXboWqSLZ/d2h6DIh6RffRIUmmPVZx
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/8] Revert "Add ptest for glib."
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Feb 2013 17:01:02 -0000
Content-Type: text/plain; charset=UTF-8

On 5 February 2013 15:55, Bernhard Reutner-Fischer
<rep.dot.nop@gmail.com> wrote:
> This reverts commit dec6f912d68f52748f645b6af411f189cf464f85.
>
> This breaks core-image-sato-sdk for TCLIBC="uclibc".

Ouch.  How about we fix it instead of reverting this?

Ross


