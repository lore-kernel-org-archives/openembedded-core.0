Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Sel1f-0007wa-NA
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jun 2012 12:42:11 +0200
Received: from mail-qa0-f49.google.com ([209.85.216.49])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 13 Jun 2012 03:31:18 -0700
Received: by qabj40 with SMTP id j40so1185058qab.15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2012 03:31:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=taKFOlEKehmgNMPYDc0ye+8xxP+9ogXpyKteJK8PLX8=;
	b=AjG1geoGTrPZTiGmQFyNmayQxHEm5UDJe8CSo7I1nwN4wn3Ll/BmjQANVjEQ9NzaAz
	6JwLS5nu37lHsGHgyCQDicywHhfhRjfG6XhROT9V/u/8TEZUpABYivBihJOPTNVJ/5lG
	c8mqJZXlO9WkkTts54pSzwa0zgghxhPf3HlTssmC17zeRdlLumigdEFBXWLnboZrMSXe
	v4eqcmMiuQGNkywUshnhDEKo+hnPlxFOlZ3kzn92YzXKHsVJS8wESYCqz2trpOEEodqQ
	kxSAy16jCpfWthEFgtKozSXkdKzfnVHAhvMP8DSWZQ7Aw4vJ2dBBgenGG5qvcZfZxSfr
	IW0w==
Received: by 10.224.220.17 with SMTP id hw17mr11522401qab.89.1339583477261;
	Wed, 13 Jun 2012 03:31:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.251.142 with HTTP; Wed, 13 Jun 2012 03:30:56 -0700 (PDT)
In-Reply-To: <1339560104-10189-3-git-send-email-laurentiu.palcu@intel.com>
References: <1339560104-10189-1-git-send-email-laurentiu.palcu@intel.com>
	<1339560104-10189-3-git-send-email-laurentiu.palcu@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 13 Jun 2012 11:30:56 +0100
Message-ID: <CAJTo0LYmE3d3m9Ov5TQV3ERdqMGXcECz2nYbfdy+3z-QzxuJFQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmaztHcT+fg9J7l/A1iqOeNu4gJ10x0K4v0hL+aWlvMDvGeydF2mSodIQcbgGpPhlk8nenT
Subject: Re: [PATCH v2 2/2] connman: make useradd parameters consistent with rootless X
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
X-List-Received-Date: Wed, 13 Jun 2012 10:42:11 -0000
Content-Type: text/plain; charset=UTF-8

On 13 June 2012 05:01, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
> Both connman and rootless X share the same xuser. However, useradd
> parameters are not consistent and if connman runs useradd first,
> rootless X will be broken.

You'll also want to bump PR, or even better use INC_PR in the .inc:

INC_PR="r6" (current PR is 5, so bump when moving)

And then use that variable in the .bb:

PR = "${INC_PR}.0"

Ross


