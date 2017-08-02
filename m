Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id D62B67820C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Aug 2017 11:24:08 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id c74so19122989iod.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Aug 2017 04:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sQAu4N/xMq+DSBCdynXcBG5iCj4ergWNgQMKRpOerU8=;
	b=it2BUOsAj+NeWhLwgA7WhJDXtTlr52oRRFrvDt0ZdrKbfbuug5FSHkUyH2x9w4G4Hh
	yLA9E7iNCXypBNMpIdryk3XLCH+CroVsmuS20XSmbqwXmatg/fQGlzBPrknyvMFVU0yg
	oVzqXMJNUjsJDz/jsrZaS9WlqbAQNvEKKslEi4KKYpF1Zcn5v75EA++hr1CxJGYDlDEo
	6HTk3HCROwAMNWuvF9/0SliwAbs4nXBt+MQC8lfT41UYBWjh4uQl5oC0WV7F6ZbUdejW
	SrmtyNVuO424qPs5P81TvQnnPSl00FzLrU55aMhXMsP/uQ1iyk18Dp52r3DlQLh4E39W
	eZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sQAu4N/xMq+DSBCdynXcBG5iCj4ergWNgQMKRpOerU8=;
	b=nc4JcApPtuRINfcGAbp3oEoUhKQTSdu2sZdWHeqb46AcAbDYULzRHzcuEJT7DZMwUy
	SxWcmyDPr3AXOJclHaeEAhCfuOpV1JcdAo/27mJq8SQ6al6mzGbqueBh+/O9czsbtZUP
	1rqBtHxjhYfaHGlZ2ZIvzoM2LpvHsdM8FUkEldbRv2Z/k38CqqtBFWLmH+DrSX+7Hg40
	UmxFt4zoCmah69rMKL8GFGWlxqP934qQ2o6RR2kSChByatYOxGvxvBpNZfgv17bcwTYG
	LfVffNc819AzsEUk6yypt6W230J14DEpRrtj1PJZPFQx9GiQ4+lsZ2SoeAHMoIs1N6lK
	cD7g==
X-Gm-Message-State: AIVw1135ueMai9mVvzjA+1qU5rDQkqLbnVHUf4oPd6KTbKbw6SQdUynN
	YBlbntf1BZ4Ah9kwKnoWAkRvtvgW13NprJU=
X-Received: by 10.107.132.33 with SMTP id g33mr24898567iod.300.1501673049769; 
	Wed, 02 Aug 2017 04:24:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Wed, 2 Aug 2017 04:23:49 -0700 (PDT)
In-Reply-To: <1501144856-17637-3-git-send-email-rebecca.swee.fun.chang@intel.com>
References: <1501144856-17637-1-git-send-email-rebecca.swee.fun.chang@intel.com>
	<1501144856-17637-3-git-send-email-rebecca.swee.fun.chang@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 2 Aug 2017 12:23:49 +0100
Message-ID: <CAJTo0LZiG8Rcf=2tT9rJwN7QGpBxaDsD_04vbS_a9RCvWYpsiQ@mail.gmail.com>
To: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv4 2/4] recipetool: create: being able to set branch when revision is provided
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
X-List-Received-Date: Wed, 02 Aug 2017 11:24:09 -0000
Content-Type: multipart/alternative; boundary="001a113ed2e8b366d60555c38091"

--001a113ed2e8b366d60555c38091
Content-Type: text/plain; charset="UTF-8"

On 27 July 2017 at 09:40, Chang Rebecca Swee Fun <
rebecca.swee.fun.chang@intel.com> wrote:

> When recipetool create is run on a git URL and a revision specified
> that is not on master, and "branch=" isn't already in the URL, then
> we should get the correct branch and append the branch to the URL.
>
> If the revision was found on multiple branches, we will display error
> to inform user to provide a correct branch and exit.
>

I think this is causing the selftests to fail:

2017-08-02 04:16:40,204 - oe-selftest - INFO - FAIL [12.984s]:
test_recipetool_create_git (recipetool.RecipetoolTests)
2017-08-02 04:16:40,204 - oe-selftest - INFO -
----------------------------------------------------------------------
2017-08-02 04:16:40,205 - oe-selftest - INFO - Traceback (most recent call
last):
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/core/decorator/__init__.py",
line 32, in wrapped_f
    return func(*args, **kwargs)
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/cases/recipetool.py",
line 403, in test_recipetool_create_git
    self._test_recipe_contents(recipefile, checkvars, inherits)
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/cases/devtool.py",
line 52, in _test_recipe_contents
    self.assertEqual(value, needvalue, 'values for %s do not match' % var)
AssertionError: 'git://git.yoctoproject.org/libmatchbox;branch=master' !=
'git://git.yoctoproject.org/libmatchbox'
- git://git.yoctoproject.org/libmatchbox;branch=master
?                                       --------------
+ git://git.yoctoproject.org/libmatchbox

 : values for SRC_URI do not match

Looks like recipetool is adding branch=master even though that is the
default value so I'd suggest should be filtered out.

Ross

--001a113ed2e8b366d60555c38091
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 27 July 2017 at 09:40, Chang Rebecca Swee Fun <span dir=
=3D"ltr">&lt;<a href=3D"mailto:rebecca.swee.fun.chang@intel.com" target=3D"=
_blank">rebecca.swee.fun.chang@intel.com</a>&gt;</span> wrote:<br><div clas=
s=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-sty=
le:solid;border-left-color:rgb(204,204,204);padding-left:1ex">When recipeto=
ol create is run on a git URL and a revision specified<br>
that is not on master, and &quot;branch=3D&quot; isn&#39;t already in the U=
RL, then<br>
we should get the correct branch and append the branch to the URL.<br>
<br>
If the revision was found on multiple branches, we will display error<br>
to inform user to provide a correct branch and exit.<br></blockquote><div><=
br></div><div>I think this is causing the selftests to fail:</div><br>2017-=
08-02 04:16:40,204 - oe-selftest - INFO - FAIL [12.984s]: test_recipetool_c=
reate_git (recipetool.RecipetoolTests)<br>2017-08-02 04:16:40,204 - oe-self=
test - INFO - -------------------------------------------------------------=
---------<br>2017-08-02 04:16:40,205 - oe-selftest - INFO - Traceback (most=
 recent call last):<br>=C2=A0 File &quot;/home/pokybuild/yocto-autobuilder/=
yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/core/decorator/__init_=
_.py&quot;, line 32, in wrapped_f<br>=C2=A0 =C2=A0 return func(*args, **kwa=
rgs)<br>=C2=A0 File &quot;/home/pokybuild/yocto-autobuilder/yocto-worker/ni=
ghtly-oe-selftest/build/meta/lib/oeqa/selftest/cases/recipetool.py&quot;, l=
ine 403, in test_recipetool_create_git<br>=C2=A0 =C2=A0 self._test_recipe_c=
ontents(recipefile, checkvars, inherits)<br>=C2=A0 File &quot;/home/pokybui=
ld/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/s=
elftest/cases/devtool.py&quot;, line 52, in _test_recipe_contents<br>=C2=A0=
 =C2=A0 self.assertEqual(value, needvalue, &#39;values for %s do not match&=
#39; % var)<br>AssertionError: &#39;git://<a href=3D"http://git.yoctoprojec=
t.org/libmatchbox;branch=3Dmaster">git.yoctoproject.org/libmatchbox;branch=
=3Dmaster</a>&#39; !=3D &#39;git://<a href=3D"http://git.yoctoproject.org/l=
ibmatchbox">git.yoctoproject.org/libmatchbox</a>&#39;<br>- git://<a href=3D=
"http://git.yoctoproject.org/libmatchbox;branch=3Dmaster">git.yoctoproject.=
org/libmatchbox;branch=3Dmaster</a><br>? =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 --------------<br>+ git://<a href=3D"http://git.yo=
ctoproject.org/libmatchbox">git.yoctoproject.org/libmatchbox</a> <br><br>=
=C2=A0: values for SRC_URI do not match </div><div class=3D"gmail_quote"><b=
r></div><div class=3D"gmail_quote">Looks like recipetool is adding branch=
=3Dmaster even though that is the default value so I&#39;d suggest should b=
e filtered out.</div><div class=3D"gmail_quote"><br></div><div class=3D"gma=
il_quote">Ross</div></div></div>

--001a113ed2e8b366d60555c38091--
