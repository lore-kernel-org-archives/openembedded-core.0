Return-Path: <cazfi74@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id A847D60232
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Oct 2015 04:31:44 +0000 (UTC)
Received: by lbos8 with SMTP id s8so33175995lbo.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Oct 2015 21:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=DAt5AiW8FatJH3dEUMDmD0nDf4zJSEqMLtO6s/qg3HE=;
	b=nDsyFkle+9UnioaaP1YWRs8W+sOG4GEWSoxEMgyhO8RZ8MHARmAU9lmFk+liLxDlk/
	Du+0orh1mhrFsHgo/+fGtfwNU2ug4PctVJQcQysDzC6lfIJw8VNU8d48k9V19NJ9kPl0
	v0gML/Hn5fSDJptMllsbLGHxzAqKlc0oCCw7KK5/s1vPzxjf8zimQHqTSgm6+AqoLfmP
	zxKOv4igck3h058xWtXSTFpx6M6i8bPRZPx9FfQTNh3q/G2HLi3RyCqn+CeETq4VG/wd
	aOq5269XVe2Bmh5xOjxhuctbZRVmgbLZAuSOGr0E6vwX50bI7bTIyZIgmawmchnD2Qsx
	XGAw==
MIME-Version: 1.0
X-Received: by 10.112.137.169 with SMTP id qj9mr2506953lbb.34.1444278703795;
	Wed, 07 Oct 2015 21:31:43 -0700 (PDT)
Received: by 10.25.19.32 with HTTP; Wed, 7 Oct 2015 21:31:43 -0700 (PDT)
In-Reply-To: <CAJTo0LYP2bZAA9Svxxi_XQbg5LSS1yXzAbdvC5HFg4dWFU-Nzw@mail.gmail.com>
References: <cover.1413452836.git.kai.kang@windriver.com>
	<6958f500cac37c3534a9f58a8bc7b90cc4c94b7f.1413452836.git.kai.kang@windriver.com>
	<b64576e3c49076498b7cfb0cbf9f3963@technux.se>
	<CAJTo0LZjxvCgVLFGVhn0O2PCWTGYFOM46zZ7KG_tqOZgzd9xgQ@mail.gmail.com>
	<fb59210fb91a5209c3d3ce6dbce38ff1@technux.se>
	<CAJTo0LYiW1X+kZi0ra0JUMeywQVu4w492ULyRXcytpYFWiiwng@mail.gmail.com>
	<7d91e0a2a4abbb2e84558856e1c2fa6a@technux.se>
	<CAJTo0LYP2bZAA9Svxxi_XQbg5LSS1yXzAbdvC5HFg4dWFU-Nzw@mail.gmail.com>
Date: Thu, 8 Oct 2015 07:31:43 +0300
Message-ID: <CAF6bG8eud0qLNLaqNtBVVgyff8iiSp=g1DsFUh6Sk-ECQthvvA@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Openembedded core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] readline: Security Advisory - readline - CVE-2014-2524
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
X-List-Received-Date: Thu, 08 Oct 2015 04:31:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 6 October 2015 at 17:08, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 6 October 2015 at 14:43, Petter Mab=C3=A4cker <petter@technux.se> wrot=
e:
>>
>> Great. As you will notice also when formatted properly it will not apply
>> due to that readline63-001 and readline63-002 isn't applied so  'patchle=
vel'
>> is incorrect. That makes me wondering what the patching strategy is? In =
my
>> opinion we should consider adding the official readline-6.3 patches as w=
ell.
>> Should I add a bug report for that or leave it as is (depending on the
>> strategy...)?
>
>
> Adding the rest of the patches would have been a sensible thing to do.
> Right now, we're frozen as we're about to release 2.0, but a bug or patch=
es
> post-release would be much appreciated.
>
> Ross

 The strategy I introduced in 30a38ea1ee933fb134a5ee9000298703cab93692
was not to add the patches, but to fetch them as upstream source.
 That was dropped when readline was updated to 6.3 (maybe there was no
patches for it at the time):
66bc6f4127e88db18e260c71d181aecfd58c7999


 - ML

