Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 757D060168
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 16:11:19 +0000 (UTC)
Received: by wgfl8 with SMTP id l8so58145644wgf.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 09:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=user-agent:in-reply-to:references:mime-version
	:content-transfer-encoding:content-type:subject:from:date:to:cc
	:message-id; bh=KNdI/6f9HiyVbWl/OpA5DUcCCkE0K3wequ991g84yMg=;
	b=H38oT4XkOx6hYLbsd3itS0YeYF0DpbtNCEbR+GKUkGV47U2YEgX7GBtIVVZg8devcX
	EN4JCMcmxfR97zDa+oLhT7itYHJmI7QUWGNwvR0V1HxxACoc3cuisLesMkjYqT23iOLR
	44xxaEpk1LgE0m1/v+/3F5IgKWWpjlq37j4ETFhI/PKb0+gIzIUINmDG5ELdLZGCn04A
	ITLfVkTuXoQcFpqHSkd5vLo86xmfKfzChJRh5GhdNiGx0GlG87pnChe/hpDadMtZGzwl
	EzPwtwTjfAeZEKh0b6tKqWz7euJW+K1AlszTIBk6EeqZK31UTyKvsOs49xP6/ZfeqXxh
	cnig==
X-Received: by 10.180.83.40 with SMTP id n8mr35208409wiy.57.1432138280768;
	Wed, 20 May 2015 09:11:20 -0700 (PDT)
Received: from [10.41.180.150] (089144217150.atnat0026.highway.a1.net.
	[89.144.217.150])
	by mx.google.com with ESMTPSA id dj7sm27560913wjb.3.2015.05.20.09.11.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 May 2015 09:11:20 -0700 (PDT)
User-Agent: K-9 Mail for Android
In-Reply-To: <CAOMwXhNugy4yR=P8twATp6oYjr4vr71u_NKrGAnzDq6QoSgVCA@mail.gmail.com>
References: <CAOMwXhNUPtaJfKHDuHPWoioyD2Sp8Abb_++Tdp3NAYN7-TGUcg@mail.gmail.com>
	<CAJTo0La5BpGRQEnNb34ZtV5-Po2dELjcN2mcy_Dn_e-c7=SWXg@mail.gmail.com>
	<CAOMwXhP-fdD2SjRrOFNR-aS7Caa30sxiC-Js_Jr8B5_+Q8uHow@mail.gmail.com>
	<CAJTo0Lb5owzy0iq6xojbr6a20_VKm4JidZO=H48hLdqnSx5Udw@mail.gmail.com>
	<CAOMwXhOG9=fraTJfnuoWUY=e6ZwATRCKHOmUvTerz7m+08T_sg@mail.gmail.com>
	<CAOMwXhMWtUxfdN_+dy-vYOVtQvL8sknTDxyAbfcygML2idYJsA@mail.gmail.com>
	<CAJTo0LbAzuA6m6bvZG5oOhqwGKavxh=enywV4MzoHmONAOYUTA@mail.gmail.com>
	<CAOMwXhNkjpH-jQS=c0RkPyGVQ4D3JCXAyRmrWckr3XcYwf9jgA@mail.gmail.com>
	<CAC1BbcTWajWUmkPAvjOT_WPhR3z1EhU0QKfcc3Y7Z4F7cARc0Q@mail.gmail.com>
	<CAOMwXhNO_NQLCdNGU3SSvoeV_C4+m5w3=9hydiMQhq-=W_kt5A@mail.gmail.com>
	<CAC1BbcRo+NBR-b-bpc0kEx77HVTCj-TkjNpyB_r1fXpRvuLtgQ@mail.gmail.com>
	<CAOMwXhPZCsbfJa1CmiRbuHfXkHBTfEER7zJMxUa2riEevwQjAg@mail.gmail.com>
	<DB5D6EDE-32C8-43E9-8105-15624243E3E1@gmail.com>
	<CAOMwXhNugy4yR=P8twATp6oYjr4vr71u_NKrGAnzDq6QoSgVCA@mail.gmail.com>
MIME-Version: 1.0
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed, 20 May 2015 18:11:08 +0200
To: Laszlo Papp <lpapp@kde.org>
Message-ID: <048B2443-5111-4B5C-84CC-923D18AD7C12@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: busybox: passwd: applet not found
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
X-List-Received-Date: Wed, 20 May 2015 16:11:21 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8

On May 20, 2015 5:58:32 PM GMT+02:00, Laszlo Papp <lpapp@kde.org> wrote:


>Well, I understand and appreciate that opinions vary, but if busybox
>had shipped 3 binaries at the end of the build processes, then their
>naming would be "standard" led by busybox upstream. Currently, there
>is no way to standardize it if Yocto thinks it should be called
>busybox.suid and e.g. (imaginary example) buildroot thinks it should
>be called suid.busybox. This would be less than ideal if my software
>has to work with both.

If you can then I'd set PREFER_APPLETS and use busybox hush or busybox ash as /bin/sh with one binary and thus avoid the whole filesystem roundtrip penalties.

At least that is what one normally does anyway and which works satisfactorily in a lot if setups.

Anyway, good to see it's not a busybox or compiler bug so all is well as far as I'm concerned.

thanks,


