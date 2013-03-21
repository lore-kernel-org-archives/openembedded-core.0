Received: from mail-vc0-f171.google.com ([209.85.220.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UIdQX-0004K8-1i
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Mar 2013 12:13:03 +0100
Received: by mail-vc0-f171.google.com with SMTP id ha11so2192690vcb.30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2013 03:55:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=pHIRA9j5Ysa1v/QUZXWpSWn29/ryFViWqcPJEOpjeIE=;
	b=m9fSmuO+IRmQ0uC4TeXJH7N1MfqDFwhyl9/GiFXwat8Jtuu2lZaU/hUwl6RGW3qddp
	f2PByMO/9H/3d1vAiJU/PInslYbJtkt+5bSHv8Dz0Bz6CKKDi55foaOhDz2oyseYZhOg
	A0CaHRU4IYAk7Ww/9Vmcb0I64mVV/1BWxQzvIR5BaHx8rYpD//AmsPYkyWr6C1UO8Kb2
	sH1Nc6brGYBUzrYljwTKskdbFmOOfRR2jNjSL89dQnyXrbDt1ApsACY5nO8etBB/+WO7
	QLsNAM9hzSpa4IrZ467qcRFhzFn8oJ8egCfp7DGqSy9n3HDlAt0Sfy9wRBCF2KM71VWV
	glAw==
X-Received: by 10.52.230.197 with SMTP id ta5mr10733503vdc.103.1363863352964; 
	Thu, 21 Mar 2013 03:55:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.125.102 with HTTP; Thu, 21 Mar 2013 03:55:32 -0700 (PDT)
In-Reply-To: <1363816759-24737-1-git-send-email-obi@opendreambox.org>
References: <1363816759-24737-1-git-send-email-obi@opendreambox.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 21 Mar 2013 10:55:32 +0000
Message-ID: <CAJTo0LbXkrf=8ii=OfStD03jQXM_Rxy4baoshQ_VXttgydFgcA@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
X-Gm-Message-State: ALoCoQlw5IAkapYTw8ujzUAJE4i/0sAEuCckPey1wBX97uOmpr0whAbAMwhvCyetT8Z8KWm04yfp
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] busybox: fix FILES_${PN}-syslog assignment
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
X-List-Received-Date: Thu, 21 Mar 2013 11:13:05 -0000
Content-Type: text/plain; charset=UTF-8

On 20 March 2013 21:59, Andreas Oberritter <obi@opendreambox.org> wrote:
> This variable was assigned twice.
>
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>

Squashed into my pending systemd branch, thanks Andreas.

Ross


