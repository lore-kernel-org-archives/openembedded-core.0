Return-Path: <jpewhacker@gmail.com>
Received: from mail-ot0-f194.google.com (mail-ot0-f194.google.com
	[74.125.82.194])
	by mail.openembedded.org (Postfix) with ESMTP id 66B9374E98
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jun 2018 16:20:33 +0000 (UTC)
Received: by mail-ot0-f194.google.com with SMTP id w22-v6so13131511otk.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jun 2018 09:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=eT2KXqUyTFvditeR2RqTYw4SHgTcJUt9FTjcwR+pCGM=;
	b=U800ytWCraG829FHmmBOKoomEC7pvVZtBXhU2dQBcJw9+ZuJkz+/SktlMHBXyyOrQa
	RGJpkGV04OQF+kwI26NvcdIEtFDQLtXWWSsilADU23ONhWv9KRTsWEb9buc8smqqxvfE
	1uTXcVdBCQhIjOvUzAf3OjIMw4Ar3hPbGBEsvPmro21fAIJ3ZrydJnDvvKWaEHkk4u/9
	Z5H/sdZUiAXWXpz6igg67ho7/aYMYcbAHxiSk+ZDFDIxWLF5c5CnDUez35oPfCsQijrU
	9Im/CLOG0GjTFUBq9f0MFvUZHxcnK35gVDiEyr4Wu2Tqjxu+ctY1S77As9P3noirbVTw
	XxrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=eT2KXqUyTFvditeR2RqTYw4SHgTcJUt9FTjcwR+pCGM=;
	b=KfsYrAgEGFkrb8yzaiVOfiJXuph4Rw7HHKoRwR8oeHvuiWdZW96cBxciY84+ATvpBZ
	Qm1tvS4q1zujmW+n6boWMgepDM5gBTqOsvLNqpSrvLpE6OqPPsSCDxBbIIg0D9UsA8o8
	OZOTMSwCg2PLByOnOGEhuVeSJKZ6UVG2s96fah9yE5P+QVp50Nv9RKqOiFf5Ky8bHqeQ
	Q1VoOV4si0dtmk9sLZXIIbU6XVE58HuO5lo5Z9MCMtR+Z5wgqnO8ZY1Tl57tycMrJZ4h
	Mcbny3WsFM/nyS3LTKMGMva/u1//FSwUf5w/74fiWaUrX+ZZ5CnfG1ycYBnpd0pnIkrm
	DJRQ==
X-Gm-Message-State: APt69E3fmReNsrX+RhD6iBabfDHypvFjpoJehJhTaIT/PSt810TBPgf4
	DoX9y7z8r+n6qSS+h+rY7Vw6F4mqh4mkify0uD4=
X-Google-Smtp-Source: AAOMgpcAUsM2pFJlMrFxMD7AlQYH3jNLfv19pYN24hGQdve3oLAkay3HEk1OXkBD5YUuIM+VT8p6q6obzRcvGu8IY5w=
X-Received: by 2002:a9d:25cd:: with SMTP id
	q71-v6mr11910440ota.262.1530375634226; 
	Sat, 30 Jun 2018 09:20:34 -0700 (PDT)
MIME-Version: 1.0
References: <20180628175342.16560-1-JPEWhacker@gmail.com>
	<20180629175445.21871-1-JPEWhacker@gmail.com>
	<7fa47b1ad1e01ac0e5d5606ae69ae29a06e94b00.camel@linuxfoundation.org>
In-Reply-To: <7fa47b1ad1e01ac0e5d5606ae69ae29a06e94b00.camel@linuxfoundation.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Sat, 30 Jun 2018 11:20:22 -0500
Message-ID: <CAJdd5GYqC70snX0nz50dap7-w=0WVEpP_Q57beub5xgnYP8EdQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] oe-selftest: Add bitbake-layer create-layer test
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
X-List-Received-Date: Sat, 30 Jun 2018 16:20:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 30, 2018 at 4:57 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2018-06-29 at 12:54 -0500, Joshua Watt wrote:
> > Adds a test that creates a layer, adds it to bblayers.conf, then
> > ensure
> > that it appears properly in bitbake-layers show-layers.
> >
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >  meta/lib/oeqa/selftest/cases/bblayers.py | 26
> > +++++++++++++++++++++++-
> >  1 file changed, 25 insertions(+), 1 deletion(-)
>
> I ran this on the autobuilder and it showed:
>
> https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/1154/ste=
ps/Running%20oe-selftest/logs/stdio
>
> Tests were working, it runs this test, then everything fails:
>
> 2018-06-29 23:50:23,781 - oe-selftest - INFO -  ... OK (719.550s)
> 2018-06-29 23:50:23,783 - oe-selftest - INFO -   test_bitbakelayers_add_r=
emove (bblayers.BitbakeLayers)
> 2018-06-29 23:50:39,742 - oe-selftest - INFO -  ... OK (15.959s)
> 2018-06-29 23:50:39,742 - oe-selftest - INFO -   test_bitbakelayers_creat=
elayer (bblayers.BitbakeLayers)
> 2018-06-29 23:50:49,526 - oe-selftest - INFO -  ... OK (9.783s)
> 2018-06-29 23:50:49,526 - oe-selftest - INFO -   test_bitbakelayers_flatt=
en (bblayers.BitbakeLayers)
> 2018-06-29 23:50:49,971 - oe-selftest - INFO -  ... FAIL (0.445s)
> 2018-06-29 23:50:49,971 - oe-selftest - INFO -   test_bitbakelayers_showa=
ppends (bblayers.BitbakeLayers)
> 2018-06-29 23:50:50,356 - oe-selftest - INFO -  ... FAIL (0.385s)
> 2018-06-29 23:50:50,356 - oe-selftest - INFO -   test_bitbakelayers_showc=
rossdepends (bblayers.BitbakeLayers)
> 2018-06-29 23:50:50,761 - oe-selftest - INFO -  ... FAIL (0.405s)
>
> Later you can see the error:
>
> ERROR: Layer directory '/home/pokybuild/yocto-autobuilder/yocto-worker/ni=
ghtly-oe-selftest/build/test-bitbakelayer-layercreate' does not exist! Plea=
se check BBLAYERS in /home/pokybuild/yocto-autobuilder/yocto-worker/nightly=
-oe-selftest/build/build/conf/bblayers.conf
>
> so I think something in the cleanup of the test is wrong...

Oops, sorry about that. I think I saw that my bblayer.conf file was
correctly restored after oe-selftest completed, and assumed that was
being done between each test case. It should be fixed now in V3.

I wonder if you could make oe-selftest issue a warning when it exists
if the original bblayer.conf doesn't match the current one....

>
> Cheers,
>
> Richard
>
> > diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py
> > b/meta/lib/oeqa/selftest/cases/bblayers.py
> > index 90a2249b081..f2fc8327647 100644
> > --- a/meta/lib/oeqa/selftest/cases/bblayers.py
> > +++ b/meta/lib/oeqa/selftest/cases/bblayers.py
> > @@ -2,7 +2,7 @@ import os
> >  import re
> >
> >  import oeqa.utils.ftools as ftools
> > -from oeqa.utils.commands import runCmd, get_bb_var
> > +from oeqa.utils.commands import runCmd, get_bb_var, get_bb_vars
> >
> >  from oeqa.selftest.case import OESelftestTestCase
> >  from oeqa.core.decorator.oeid import OETestID
> > @@ -85,6 +85,30 @@ class BitbakeLayers(OESelftestTestCase):
> >          self.assertNotEqual(result.status, 0, 'bitbake-layers show-
> > recipes -i nonexistentclass should have failed')
> >          self.assertIn('ERROR:', result.output)
> >
> > +    def test_bitbakelayers_createlayer(self):
> > +        priority =3D 10
> > +        layername =3D 'test-bitbakelayer-layercreate'
> > +        layerpath =3D os.path.join(get_bb_var('COREBASE'), layername)
> > +        self.assertFalse(os.path.exists(layerpath), '%s should not
> > exist at this point in time' % layerpath)
> > +        result =3D runCmd('bitbake-layers create-layer --priority=3D%d
> > %s' % (priority, layerpath))
> > +        self.track_for_cleanup(layerpath)
> > +        result =3D runCmd('bitbake-layers add-layer %s' % layerpath)
> > +        result =3D runCmd('bitbake-layers show-layers')
> > +        find_in_contents =3D re.search(re.escape(layername) + r'\s+' +
> > re.escape(layerpath) + r'\s+' + re.escape(str(priority)),
> > result.output)
> > +        self.assertTrue(find_in_contents, "%s not found in
> > layers\n%s" % (layername, result.output))
> > +
> > +        layervars =3D ['BBFILE_PRIORITY', 'BBFILE_PATTERN',
> > 'LAYERDEPENDS', 'LAYERSERIES_COMPAT']
> > +        bb_vars =3D get_bb_vars(['BBFILE_COLLECTIONS'] + ['%s_%s' %
> > (v, layername) for v in layervars])
> > +
> > +        for v in layervars:
> > +            varname =3D '%s_%s' % (v, layername)
> > +            self.assertIsNotNone(bb_vars[varname], "%s not found" %
> > varname)
> > +
> > +        find_in_contents =3D re.search(r'(^|\s)' +
> > re.escape(layername) + r'($|\s)', bb_vars['BBFILE_COLLECTIONS'])
> > +        self.assertTrue(find_in_contents, "%s not in
> > BBFILE_COLLECTIONS" % layername)
> > +
> > +        self.assertEqual(bb_vars['BBFILE_PRIORITY_%s' % layername],
> > str(priority), 'BBFILE_PRIORITY_%s !=3D %d' % (layername, priority))
> > +
> >      def get_recipe_basename(self, recipe):
> >          recipe_file =3D ""
> >          result =3D runCmd("bitbake-layers show-recipes -f %s" %
> > recipe)

