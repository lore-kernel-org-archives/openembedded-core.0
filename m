Return-Path: <ross.burton@intel.com>
Received: from mail-pb0-f50.google.com (mail-pb0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id 23EE26065B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 11:52:15 +0000 (UTC)
Received: by mail-pb0-f50.google.com with SMTP id wy17so204455pbc.23
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 04:52:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=hk9tgEBDcndg8fzPyEAf+qVkwzmeot6gC5kn6hqof5c=;
	b=VZspOgV19L+QwrOpAMVA5FKnXFqcvZAk5Cflgzw1v1YXNexigFDafF3PQwf//eAmpo
	o8ik9zte16rxeazbgFi13w53EzlVgbydBhNSza2UmQtO0r7NZhv6m+5xevJ+BOsJQGgL
	Gyrr0bBWd/sBg3LStPGf39WukA2Xu9LHvGR6CEjOfPLPNlFsIYegu9jQhgoM4yw9PFBG
	6DhOUNc6GbTgsOUchZdvwHAKu6nsa6LA97J2j0hqMtkdz8P9T8nnLKkFmLrG0Sfr5Qfn
	xUB/wzB3lFCDbVV1/Qwddcpb8dL+Jv9/LNj9COyzzHaa+m04t8FK106RgxdG+qLUPX7n
	38Cw==
X-Received: by 10.68.239.228 with SMTP id vv4mr7561578pbc.5.1369914735775;
	Thu, 30 May 2013 04:52:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.66.252.98 with HTTP; Thu, 30 May 2013 04:51:55 -0700 (PDT)
In-Reply-To: <20130530131142.4050a9c7@e6520eb>
References: <1369899843-3318-1-git-send-email-eric@eukrea.com>
	<CA+chaQeCTAq3dtUao2+oAmETHe5s7gkTjtd86fS2NBcyR=bmdQ@mail.gmail.com>
	<CAJTo0LYDRHqO2kveMW4ftq3g4BNjLE_sJJ6mej2cNbaC3TKh6g@mail.gmail.com>
	<20130530123230.78dab18a@e6520eb> <1369910940.14887.295.camel@ted>
	<20130530131142.4050a9c7@e6520eb>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 30 May 2013 12:51:55 +0100
Message-ID: <CAJTo0LY0D=MN+vMS4U1YdZBvYXpKmHfV0ADvRbBxT_kPM8PEpw@mail.gmail.com>
To: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
X-Gm-Message-State: ALoCoQnrhdT3ITP7Fr9Hdg5IfBbPUDjD0RN5snvAky0jEwaKW+X9CKovfOl3M7ngmt2chFzBEvxw
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] hicolor-icon-theme: keep inherited dependencies
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
X-List-Received-Date: Thu, 30 May 2013 11:52:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 30 May 2013 12:11, Eric B=C3=A9nard <eric@eukrea.com> wrote:
>> I have a suspicion we really want a gnomebase inherit in the recipe
>> instead of gnome and that might solve serveral issues in one.
>>
> inherit gnomebase and remove DEPENDS=3D""
> seems to work fine (the postinst and postrm scripts are removed).
> removing DEPENDS=3D"" is not a big issue as it only brings native
> packages :
> DEPENDS =3D autoconf-native automake-native gnome-common-native
> gnu-config-native libtool-native pkgconfig-native

Sounds fine, they actually are the build-dependencies.

Ross

