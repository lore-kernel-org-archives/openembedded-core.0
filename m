Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 76E8160290
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 20:08:05 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id 190so200669543iow.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 13:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ADq6JuRvjGqfLQcIjY9xeMFCQlrU68IskoG7yTHa5wE=;
	b=PhWfsntegkClqkdbc4GUZH7FF9ydoLQOX5JgL1fIZ8xMDgF2OQGmI9T9Uv6pF160iM
	2UvjYYOOFZ6cGphq44D6XiIsonm5bii2EMACLRoApHWIymxoKfOd86mmsTzInk7qwzr0
	3ltoT99YzpuJns1+3E+J6PoWU7k5DflDiOFt3kD94b70XIKgqnMfwcQco+ZnT6ZDAWyp
	UDzTauF2eaE3/WR78Oyww1tr4Oc2eNil38DoMTUpMMUQg9jBuAMNcmIR+hQ3REwdKWmH
	JyCome4FfNDyLE7wuLLaYESSrIUzSh/0rzca40SbsbPlVSAvp+LbnYVPrj9yAw2DnFPl
	lB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ADq6JuRvjGqfLQcIjY9xeMFCQlrU68IskoG7yTHa5wE=;
	b=lpyZf7lMrM5Wd/SWtqEomNocArR3nBmHDkUZG6vclJcqEWzFWle3xK8BUicOos7F8A
	QGPUlKk2kl8Av6fHO6wLtAPpv6y+Bs7o2HyMyz8Z9M6HZhwxLngRz/VZaDh6z48eroL3
	ciINIruRKHaPTNV2kRPgbd+nVFRf0oHl8EXKVEkyfzMvDYG1M48TsMuDOqkA1W7W0E87
	uVew+77lFHoq23EonkbiWf+A5qE1bM3tw1qAIr44U/1MGGk4Hw24y1bE2hcFW1WhYscE
	VoNhD8Yp1SFNFZnrhvGFKA/kSuMmsg/M5WS88LxmNcXyV9zzOp51IfHa5ZetOgO4bnLH
	NU1A==
X-Gm-Message-State: ALyK8tKaZB2digQFvvi02mXYKSBoEqRHgJlBDVJq2pJGYCVimY8XB6QJcXdzjblvfQ7F7vhIYydmnjaZrPfjZhy9
X-Received: by 10.107.135.234 with SMTP id r103mr3865202ioi.133.1464034086301; 
	Mon, 23 May 2016 13:08:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Mon, 23 May 2016 13:07:46 -0700 (PDT)
In-Reply-To: <CABcZAN=Zcm901n3Lvffh2y6aUqmLtHOWz=rx5ztQK2x26cVQ1Q@mail.gmail.com>
References: <e889a21f09e4bcbddd05ee90a914600d33540dfa.1462489051.git.chris_larson@mentor.com>
	<1463763860-4124-1-git-send-email-kergoth@gmail.com>
	<CAMKF1sozc-Xjvd_CPAT5DEeE=oNmqRnWV+qk0QDuq+4S=rk0Wg@mail.gmail.com>
	<1464010266.3095.41.camel@intel.com>
	<CABcZAN=Zcm901n3Lvffh2y6aUqmLtHOWz=rx5ztQK2x26cVQ1Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 23 May 2016 21:07:46 +0100
Message-ID: <CAJTo0LZEcWDsN=S+RhdNhaFBxoNNJqnDUG4RT32NRZ=s2kg0mg@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3] mkelfimage: obey LDFLAGS, sort out HOST_ flags
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
X-List-Received-Date: Mon, 23 May 2016 20:08:06 -0000
Content-Type: multipart/alternative; boundary=001a113fc2b6a75337053387ff02

--001a113fc2b6a75337053387ff02
Content-Type: text/plain; charset=UTF-8

On 23 May 2016 at 20:59, Christopher Larson <kergoth@gmail.com> wrote:

> I'm not opposed to reverting this, as the issue being fixed was clearly
> not as bad as this result, but I'm completely unable to repro this for
> beaglebone with meta-ti, either with the internal toolchain or the external
> sourcery toolchain. Was this with clang, or some specific toolchain
> version? Or perhaps ostro is doing something special there?
>

Ostro enables the security flags, which impacts the linking.

Ross

--001a113fc2b6a75337053387ff02
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 May 2016 at 20:59, Christopher Larson <span dir=3D"ltr">&lt;<a href=
=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_quote"><=
div>I&#39;m not opposed to reverting this, as the issue being fixed was cle=
arly not as bad as this result, but I&#39;m completely unable to repro this=
 for beaglebone with meta-ti, either with the internal toolchain or the ext=
ernal sourcery toolchain. Was this with clang, or some specific toolchain v=
ersion? Or perhaps ostro is doing something special there?</div></div><span=
 class=3D""></span></blockquote></div><br>Ostro enables the security flags,=
 which impacts the linking.</div><div class=3D"gmail_extra"><br></div><div =
class=3D"gmail_extra">Ross</div></div>

--001a113fc2b6a75337053387ff02--
