Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SZioe-0005EJ-6l
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 15:19:56 +0200
Received: from mail-qc0-f180.google.com ([209.85.216.180])
	by mga03.intel.com with ESMTP/TLS/RC4-MD5; 30 May 2012 06:09:35 -0700
Received: by qcmv28 with SMTP id v28so2466109qcm.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 06:09:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=xTo0Kkro+fQ6nsYnSUN0O1UcVajuRb7sbpyA4Oh47s0=;
	b=Itu77rhX+e9SHHmbfzdv1oAnP7Avm6oi/LvfhPR1it48f9hsFNjCyegSarWTW2CEb8
	QwAojTJ64EFAGmBcL4ug8vAJ73xCvhFv2idAe/e+ew8/DrD7SZykk4Kj/gB6BR9L69ry
	LBiAxu2Go0ZFQPxSMhshJf2i7/16kujeoGUJouxc6bnZmFRNwHah1HIyCa5Q9kCfC3jv
	+jIcYMKHjIWQCYRfTQiqEIYyDc7XhphARmG3QlwbXlZeiw3xiYlUEvKnRIXyB2gSG0Dj
	hH+gRJcff/2Q9XHpvydRlV074JCRAfP6/QZF/+ZZN1cGUDpYw4G5GHTpuICvghYQzXj5
	zDvw==
Received: by 10.224.0.202 with SMTP id 10mr10609236qac.63.1338383374890; Wed,
	30 May 2012 06:09:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.53.212 with HTTP; Wed, 30 May 2012 06:09:14 -0700 (PDT)
In-Reply-To: <CAMKF1sp2kUL-w==UiXT4SmykAcoN5j93vFxSF2-EmBs9mjWcjA@mail.gmail.com>
References: <cover.1338323483.git.ross.burton@intel.com>
	<e50f2bf59b64accf580fc2df96e1fbc9eb6cfb98.1338323483.git.ross.burton@intel.com>
	<CAMKF1so_=OjU2OcoVYO=B5g2KzYAgtY4aA4gNr_cv09YFcxbeQ@mail.gmail.com>
	<CAJTo0LYe1y0r-VhGqsZ1ejfhN39Awd61Zq6yGk0Bf=VN+zJrHA@mail.gmail.com>
	<CAMKF1sp2kUL-w==UiXT4SmykAcoN5j93vFxSF2-EmBs9mjWcjA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 30 May 2012 14:09:14 +0100
Message-ID: <CAJTo0LYmnmcX=qNz=uA-bQLRkS2+AXLrwbrEX+3Dv4wGx9QG0w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkJuEfPWZdFg8nY3w/n5HRpK9OIidPI9PSg0EEZhiE0q1y9AY0KW3EcNPW+Bbq8agLLT/fT
Subject: Re: [PATCH 1/4] connman: just give xuser the extra rights it needs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 May 2012 13:19:56 -0000
Content-Type: text/plain; charset=UTF-8

On 30 May 2012 14:00, Khem Raj <raj.khem@gmail.com> wrote:
> You could have created a new patch and deleted the old then for clarity

The filename is sensible, the comment was entirely rewritten, as was
the actual delta of the patch.  I don't see how this could be any more
clear really.

Ross


