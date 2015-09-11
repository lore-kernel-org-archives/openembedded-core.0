Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 6666473CBD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Sep 2015 07:19:32 +0000 (UTC)
Received: by qgez77 with SMTP id z77so56009422qge.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Sep 2015 00:19:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=+SnhxXaPZH1UDOQBh1KxZfSxAMCy3xR6lev6mkGYe5I=;
	b=i1rtJqfUb4Sx9mpLdzfce0t+//ifDTnIfzGKNKHLDOQbFQwXFT1igiyh6Y//lFMD8+
	svSTLdHcIY/m4Ue9W5SyWncQr9YzLL0+RV3jDlOVFR+BOMApsu1VHqr80alGBzig2sVc
	JeCWA2lslruwUIte+Rg2MuAFeg1djr+KJr7Ofe4jHsa4TNxTAHR45h6fGQ8qOWRpFLHF
	/Nc+EtKG0LJQNe0M4+SDN7sPs9A9a1GlnC+wF02iExfHEjH1TEX7rgeGlBK1U2auG9AY
	49IW/1wcAaVm6YLd+pBgGfNVU3x31hX2EJ3pIqMnmHhob8qddTn93qgMYAhhq9w4tWLH
	VcwA==
X-Gm-Message-State: ALoCoQnfLlFqMBtEDQO1l4TVNoGhWiUgHq2GZqFALEuanaXVGkXEG4QQg54g3gyFr9nudiAykD+J
X-Received: by 10.140.20.20 with SMTP id 20mr45762563qgi.87.1441955972482;
	Fri, 11 Sep 2015 00:19:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Fri, 11 Sep 2015 00:19:13 -0700 (PDT)
In-Reply-To: <62691.10.252.58.194.1441955566.squirrel@linux.intel.com>
References: <1441909087-3860-1-git-send-email-alexander.kanavin@linux.intel.com>
	<CAJTo0LYCw9pFKn+jkT_a-O8h4r48CCjK2DZDe5oJUsuSuKvGQA@mail.gmail.com>
	<62691.10.252.58.194.1441955566.squirrel@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 11 Sep 2015 08:19:13 +0100
Message-ID: <CAJTo0LYkuWDZtc4y6D+koQSbgi_Ko9nj6DizcmiDOF2+3gN-cQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] webkitgtk: add a new recipe for latest upstream version
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
X-List-Received-Date: Fri, 11 Sep 2015 07:19:33 -0000
Content-Type: multipart/alternative; boundary=001a11c13cbc859dd2051f738959

--001a11c13cbc859dd2051f738959
Content-Type: text/plain; charset=UTF-8

On 11 September 2015 at 08:12, <alexander.kanavin@linux.intel.com> wrote:

> Wait a moment, why do we need a second signed-off-by there? The commit
> that adds the custom patch already has my signed-off-by, so it is
> redundant to repeat it I think.
>

Because the patch and the commit are not always tied together - if the
patch gets copied for another recipe then there's no way to find out who
added it, and VCS migrations complicate chasing history.  It's not uncommon
to be chasing down who created a patch to get additional context some seven
years after it was created, which at this point in time means traversing
two repos and three VCS migrations.   I know this happens because I've
spent 30 minutes chasing a crazy patch back to monotone commits in
oe-classic only to find that I created it back in 2008...

Another real example: python3 has some setuptool patches which were added
by Khem.  From the Signed-off we can see that the patch was actually
created by Richard and simply copied from the python2 recipes.

Ross

--001a11c13cbc859dd2051f738959
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 September 2015 at 08:12,  <span dir=3D"ltr">&lt;<a href=3D"mailto:ale=
xander.kanavin@linux.intel.com" target=3D"_blank">alexander.kanavin@linux.i=
ntel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":1lz" class=3D"a3s" style=3D"overflow:hidden">Wait a moment, why do we =
need a second signed-off-by there? The commit<br>
that adds the custom patch already has my signed-off-by, so it is<br>
redundant to repeat it I think.<br></div></blockquote></div><br>Because the=
 patch and the commit are not always tied together - if the patch gets copi=
ed for another recipe then there&#39;s no way to find out who added it, and=
 VCS migrations complicate chasing history.=C2=A0 It&#39;s not uncommon to =
be chasing down who created a patch to get additional context some seven ye=
ars after it was created, which at this point in time means traversing two =
repos and three VCS migrations. =C2=A0 I know this happens because I&#39;ve=
 spent 30 minutes chasing a crazy patch back to monotone commits in oe-clas=
sic only to find that I created it back in 2008...</div><div class=3D"gmail=
_extra"><br></div><div class=3D"gmail_extra">Another real example: python3 =
has some setuptool patches which were added by Khem.=C2=A0 From the Signed-=
off we can see that the patch was actually created by Richard and simply co=
pied from the python2 recipes.</div><div class=3D"gmail_extra"><br></div><d=
iv class=3D"gmail_extra">Ross</div></div>

--001a11c13cbc859dd2051f738959--
