Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id F054F6FFFB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 11:01:15 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id u190so24576826pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 04:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=Qoc857ZM/DcGevkuDqCKIbI2tkxOUlk3uE1LgKlYZVk=;
	b=QhtnxM9FimEfC3NMIhXFeC+FeG1/0rSckBJ8gpXhcC0UPPHPWJO1ZcaZ1HHrcJP8Zj
	xgQ5b/I35CHa2E57YrF8F6yZD8q+77H1EWlZ5KSSDEjzpfvxTDpb0J4EMCrUaUKqBGSj
	YVFIQ/uneMrNH6jTjxdziA9N4MTFBhL5AphRiu/RQ8tnTPjCJZGCsfx/tLwK6RAcijJT
	Ibo/fQUCZ+JJ5BPjGKa/Irc40Ty5+e1tdhkgfAuhdDo3xcrbsaDLpGQriU4Jzzaq5Q33
	emz3CSUzFNMqzoGfOhqmPivc+gjcXWbaP+SGdgaHjfxthL5dJ+8zh0aC8rwd+hfvEKSk
	+koA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=Qoc857ZM/DcGevkuDqCKIbI2tkxOUlk3uE1LgKlYZVk=;
	b=EibjKg3uaw6TyFzIw976gqgp0s0m4m6TjYNm2nVWEOmVcoxMXwvwtyZskuugcPbe3m
	TU6xWPOfu/M8yVp7HqJFJF7TGrA+ohFbRiuiYdvYuszoT2YjC2h6E6Ttc1f9xggCB5FX
	VbQcW9MZFLGADxuJQ52NOOcjUXQagV7OcqVRYNhYMxOvxTxP07+SQNJHyWVi0UZebM3+
	o7X4SH6r09tIjARhmpc+c6ta4G0bbIRNNbAaIEMn6DcX789dyf3Dv8gdWEHF4RKCixHD
	Au3cNeU60/q7Dq1Z8Fi6advZQxQ5bMG8oo/BiuIyieo8PYMV6t86WYauucfzMNRTbzGn
	CI1Q==
X-Gm-Message-State: AD7BkJKqDy9DNxyZ/vQ0oAA8gwNOx128zQwekVBChKMmh8EzLs9M76tw02AjDLV1adkKpA==
X-Received: by 10.66.65.228 with SMTP id a4mr43651815pat.4.1458039675710;
	Tue, 15 Mar 2016 04:01:15 -0700 (PDT)
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com.
	[209.85.192.170])
	by smtp.gmail.com with ESMTPSA id s66sm3850351pfi.3.2016.03.15.04.01.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Mar 2016 04:01:13 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f170.google.com with SMTP id 124so24723016pfg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 04:01:13 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.66.63.41 with SMTP id d9mr45265622pas.1.1458039673251; Tue,
	15 Mar 2016 04:01:13 -0700 (PDT)
Received: by 10.67.3.163 with HTTP; Tue, 15 Mar 2016 04:01:13 -0700 (PDT)
In-Reply-To: <CAJTo0Lb5ehLTcYu5=twZOqJQULCX1qywXz=p1K7=E5ExWDVM2g@mail.gmail.com>
References: <1457981210-23532-1-git-send-email-otavio@ossystems.com.br>
	<CAP9ODKpGfXsyzE91Nxak39npYTZ-yLw0NkVw91z75=vuVo1UyQ@mail.gmail.com>
	<CAJTo0LaVVaY9gmtzp7tq=77GBj+rCzGBC+2K1CnOoXEk8XCwBw@mail.gmail.com>
	<CAP9ODKq2CDKAxXijkEQH75vV6QKakt2HCSXHOU-HhZ0tCCnzwg@mail.gmail.com>
	<CAJTo0LYfwrc+wteB+ez6gqZbXgM8dJO6PKrB+vf0S6+ANC7ggQ@mail.gmail.com>
	<CAP9ODKopJb0SusuYNubJz9oEMjJUDLyRBjNWDjeFD+tw0iYS3g@mail.gmail.com>
	<CAJTo0Lbx5YajNU5fcRkn1sk43LW1tCLm7p1WxCM=fQqTYo=zWA@mail.gmail.com>
	<CAP9ODKp=+6F6dMDryHOtNcMsmBL3VqHpNwioxpi3AtoxQ3ji9A@mail.gmail.com>
	<CAJTo0LY=BQxpH0Eq=86OnLB7M_bAR5+HhrWg7YqfhVPZgQ6=ng@mail.gmail.com>
	<CAP9ODKqoummpnrf_-4mZgY94u3kRTdmB0AhNX=0LGFAz0yBpVA@mail.gmail.com>
	<CABcZAN=_-oVgP+8OOggYaGox6GkDLeyhtS5+=dCvgapaKZ0TDw@mail.gmail.com>
	<CAP9ODKprS3P41A_fCApFSTmm=s9MvTDtD5J87d9fOdRm=cS0Zg@mail.gmail.com>
	<CAJTo0Lb5ehLTcYu5=twZOqJQULCX1qywXz=p1K7=E5ExWDVM2g@mail.gmail.com>
Date: Tue, 15 Mar 2016 08:01:13 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoNSWrsjo5=dKX863+=5YKfjnUv-ic1_Q3MzQA-y9pUcg@mail.gmail.com>
Message-ID: <CAP9ODKoNSWrsjo5=dKX863+=5YKfjnUv-ic1_Q3MzQA-y9pUcg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Christopher Larson <clarson@kergoth.com>,
	Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libsdl: Only enable X11 support when the DISTRO supports it
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Mar 2016 11:01:16 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 14, 2016 at 6:26 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 14 March 2016 at 21:23, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>>
>> Do you mind to explain to me why?
>>
>> I would like to try to see your view on this.
>
>
> libsdl is a good example to be honest.  Why does your choice of target
> distro features decide what libraries the native sdl should use?  Respecting
> them means in this case that you can't have a graphical qemu.  Taking it to
> hypotheticals, just because my target is pure Wayland doesn't mean I expect
> sdl to build for Wayland without X11, especially if my desktop is X11 based.

I agree with the overall goal here however this means we ought to have
a HOST_DISTRO_FEATURES setting and not ignore it at all.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

