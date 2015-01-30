Return-Path: <walt@giroir.com>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id A313A6AC17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jan 2015 17:56:41 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id x69so35841454oia.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jan 2015 09:56:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=Dn9FqA0xFhL9D6lWm3bDQx6CL4gBAqYbW4Hj7UTLRoE=;
	b=Mk5/bxYW2ZCIDDXE4+cpxdk8NtFZ/xCB2S19ypI4iDYppHMbVF3q3JtL/z/fIC0xlV
	pdKlM3y09GljSt38lgyzqwjmvnMyqG/F4AMXHCbMCl4A9e5F8rNgGyW20or1/8PJ+VJD
	sw04w0fH9zBhkSNNNk+T2GTZX3uEpS/5xprps6DGO0pfFV4QkH1F2rC3r4VQ7aNJC5VF
	OdfrYfWsP5ctJp1iF00xjqtcPglIHaseNSx949k6j410zycDORcLjr25z9JdJToZsSL8
	8/bkLyt2+9cubb8+zgB5+PzxIM/JsvG3oUbcW38hV3TbEy+UCIkgrf2K5jVfAzFTOQVo
	XwhQ==
X-Gm-Message-State: ALoCoQka+gF1eGq2kbattfLScKAfzotEZ5O9T5y7HokXojkp9UCYSM1MRYeY1/jvz7b8f/uizuDL
X-Received: by 10.60.84.40 with SMTP id v8mr4474524oey.73.1422640602276;
	Fri, 30 Jan 2015 09:56:42 -0800 (PST)
Received: from [10.10.102.130] (168-215-245-19.static.twtelecom.net.
	[168.215.245.19])
	by mx.google.com with ESMTPSA id s10sm5457494oeo.3.2015.01.30.09.56.40
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 30 Jan 2015 09:56:41 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Walter Giroir <walt@giroir.com>
In-Reply-To: <78ABB290-AC92-4AEB-B096-EB3D3A1A9BAB@giroir.com>
Date: Fri, 30 Jan 2015 11:56:40 -0600
Message-Id: <EC9F6348-615C-4C2D-B666-FBF39FA908BE@giroir.com>
References: <78ABB290-AC92-4AEB-B096-EB3D3A1A9BAB@giroir.com>
To: openembedded-core@lists.openembedded.org
X-Mailer: Apple Mail (2.2070.6)
Cc: gary@mlbassoc.com
Subject: Re: Changes to Image Definitions in 1.7.1
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
X-List-Received-Date: Fri, 30 Jan 2015 17:56:48 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_6671CF5F-A471-4F47-8691-C1E11E07AFD6"

--Apple-Mail=_6671CF5F-A471-4F47-8691-C1E11E07AFD6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


Hello Gary,

Thanks for the response. =20

The problem is that the IMAGE_CMD for the IMAGE_FSTYPE cannot be found =
in image.py.=20
The details are below.


What I have discovered is that the layer=E2=80=99s classes directory =
is=E2=80=A6
  1. No longer required
  2. No longer parsed.

In 1.5.1 if I remove the layer=E2=80=99s classes directory, I received a =
=E2=80=9CMissing classes=E2=80=9D error.
In 1.7.1, not even a warning is generated.

Putting this class in the classes directory goes without error or =
warning
 dd if=3D/dev/urandom count=3D10 of=3Da.bbclass

The IMAGE_CLASSES is defined in the machine configuration



And here is the error
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
File: '/home/walt/workspace/wwrelay-rootfs/yocto/meta/lib/oe/image.py',
lineno: 355, function: create_image
    0351:        execute_pre_post_process(self.d, post_process_cmds)
    0352:
    0353:
    0354:def create_image(d):
*** 0355:    Image(d).create()
    0356:
    0357:if __name__ =3D=3D "__main__":
    0358:    """
    0359:    Image creation can be called independent from bitbake
environment.
File: '/home/walt/workspace/wwrelay-rootfs/yocto/meta/lib/oe/image.py',
lineno: 333, function: create
    0329:        execute_pre_post_process(self.d, pre_process_cmds)
    0330:
    0331:        self._remove_old_symlinks()
    0332:
*** 0333:        image_cmd_groups =3D self._get_imagecmds()
    0334:
    0335:        for image_cmds in image_cmd_groups:
    0336:            # create the images in parallel
    0337:            nproc =3D multiprocessing.cpu_count()
File: '/home/walt/workspace/wwrelay-rootfs/yocto/meta/lib/oe/image.py',
lineno: 303, function: _get_imagecmds
    0299:                print "************************"
    0300:                print localdata.getVar("IMAGE_CMD", True)
    0301:                print "************************"
    0302:                print "************************"
*** 0303:                cmds.append("\t" + =
localdata.getVar("IMAGE_CMD",
True)) 0304:                cmds.append(localdata.expand("\tcd
${DEPLOY_DIR_IMAGE}"))
    0305:
    0306:                if type in cimages:
    0307:                    for ctype in cimages[type]:
Exception: TypeError: cannot concatenate 'str' and 'NoneType' objects

ERROR: Function failed: do_rootfs
ERROR: Logfile of failure stored in: /home/walt/workspace/wwrelay-
rootfs/yocto/build/tmp/work/cubietruck-poky-linux-gnueabi/wigwag-prod-
lsb/1.0-r0/temp/log.do_rootfs.13308
ERROR: Task 6 (/home/walt/workspace/wwrelay-
rootfs/yocto/build/recipes/images/wigwag-prod-lsb.bb, do_rootfs) failed =
with
exit code '1'
NOTE: Tasks Summary: Attempted 3977 tasks of which 3976 didn't need to =
be
rerun and 1 failed.

         =20

---------------------

On 2015-01-30 06:57, Walter Giroir wrote:
>=20
> I am in the process of moving from Yocto 1.5.1 to 1.7.1.
>=20
> Overall the process has gone very smooth but I have one blocking =
issue.
>=20
> I have a layer with an Image defined in =
new_layer/classes/new_image.bblcass
>=20
> When running with 1.5.1, it works fine.
> When running with 1.7.1, it does not even parse the file

Details?  Otherwise, you'll only get guesses :-(

>=20
> Has anyone encountered this or is there a description of the changes =
in this area.
>=20
> Thanks in advance,
> =E2=80=94Walt
>=20

--=20
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

--Apple-Mail=_6671CF5F-A471-4F47-8691-C1E11E07AFD6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div class=3D""><br class=3D""></div><div class=3D"">Hello =
Gary,</div><div class=3D""><br class=3D""></div><div class=3D"">Thanks =
for the response. &nbsp;</div><div class=3D""><br class=3D""></div><div =
class=3D"">The problem is that the IMAGE_CMD for the IMAGE_FSTYPE cannot =
be found in image.py.&nbsp;</div><div class=3D"">The details are =
below.</div><div class=3D""><br class=3D""></div><div class=3D""><br =
class=3D""></div><div class=3D"">What I have discovered is that the =
layer=E2=80=99s classes directory is=E2=80=A6</div><div class=3D"">&nbsp; =
1. No longer required</div><div class=3D"">&nbsp; 2. No longer =
parsed.</div><div class=3D""><br class=3D""></div><div class=3D"">In =
1.5.1 if I remove the layer=E2=80=99s classes directory, I received a =
=E2=80=9CMissing classes=E2=80=9D error.</div><div class=3D"">In 1.7.1, =
not even a warning is generated.</div><div class=3D""><br =
class=3D""></div><div class=3D"">Putting this class in the classes =
directory goes without error or warning</div><div class=3D""><div =
style=3D"margin: 0px; font-family: Menlo;" class=3D"">&nbsp;dd =
if=3D/dev/urandom count=3D10 of=3Da.bbclass</div></div><div class=3D""><br=
 class=3D""></div><div class=3D"">The IMAGE_CLASSES is defined in the =
machine configuration</div><div class=3D""><br class=3D""></div><div =
class=3D""><br class=3D""></div><div class=3D""><br class=3D""></div><div =
class=3D""><div class=3D""><div class=3D"">And here is the error<br =
class=3D"">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
<br class=3D"">File: =
'/home/walt/workspace/wwrelay-rootfs/yocto/meta/lib/oe/image.py',<br =
class=3D"">lineno: 355, function: create_image<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;0351: =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;execute_pre_post_process(self.d,=
 post_process_cmds)<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;0352:<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;0353:<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;0354:def create_image(d):<br =
class=3D"">*** 0355: &nbsp;&nbsp;&nbsp;Image(d).create()<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;0356:<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;0357:if __name__ =3D=3D =
"__main__":<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;0358: =
&nbsp;&nbsp;&nbsp;"""<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;0359: =
&nbsp;&nbsp;&nbsp;Image creation can be called independent from =
bitbake<br class=3D"">environment.<br class=3D"">File: =
'/home/walt/workspace/wwrelay-rootfs/yocto/meta/lib/oe/image.py',<br =
class=3D"">lineno: 333, function: create<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;0329: =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;execute_pre_post_process(self.d,=
 pre_process_cmds)<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;0330:<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;0331: =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;self._remove_old_symlinks()<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;0332:<br class=3D"">*** 0333: =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;image_cmd_groups =3D =
self._get_imagecmds()<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;0334:<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;0335: =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for image_cmds in =
image_cmd_groups:<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;0336: =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# =
create the images in parallel<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;0337: =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nproc =
=3D multiprocessing.cpu_count()<br class=3D"">File: =
'/home/walt/workspace/wwrelay-rootfs/yocto/meta/lib/oe/image.py',<br =
class=3D"">lineno: 303, function: _get_imagecmds<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;0299: =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;print "************************"<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;0300: =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;print localdata.getVar("IMAGE_CMD", True)<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;0301: =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;print "************************"<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;0302: =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;print "************************"<br class=3D"">*** 0303: =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;cmds.append("\t" + localdata.getVar("IMAGE_CMD",<br =
class=3D"">True)) 0304: =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;cmds.append(localdata.expand("\tcd<br =
class=3D"">${DEPLOY_DIR_IMAGE}"))<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;0305:<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;0306: =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;if type in cimages:<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;0307: =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for ctype in cimages[type]:<br =
class=3D"">Exception: TypeError: cannot concatenate 'str' and 'NoneType' =
objects<br class=3D""><br class=3D"">ERROR: Function failed: =
do_rootfs<br class=3D"">ERROR: Logfile of failure stored in: =
/home/walt/workspace/wwrelay-<br =
class=3D"">rootfs/yocto/build/tmp/work/cubietruck-poky-linux-gnueabi/wigwa=
g-prod-<br class=3D"">lsb/1.0-r0/temp/log.do_rootfs.13308<br =
class=3D"">ERROR: Task 6 (/home/walt/workspace/wwrelay-<br =
class=3D"">rootfs/yocto/build/recipes/images/wigwag-prod-lsb.bb, =
do_rootfs) failed with<br class=3D"">exit code '1'<br class=3D"">NOTE: =
Tasks Summary: Attempted 3977 tasks of which 3976 didn't need to be<br =
class=3D"">rerun and 1 failed.<br class=3D""></div><br =
class=3D""></div></div><div class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;</div><div class=3D""><br class=3D""></div><div =
class=3D"">---------------------</div><br class=3D"">On 2015-01-30 =
06:57, Walter Giroir wrote:<br class=3D""><blockquote type=3D"cite" =
class=3D""><br class=3D"">I am in the process of moving from Yocto 1.5.1 =
to 1.7.1.<br class=3D""><br class=3D"">Overall the process has gone very =
smooth but I have one blocking issue.<br class=3D""><br class=3D"">I =
have a layer with an Image defined in =
new_layer/classes/new_image.bblcass<br class=3D""><br class=3D"">When =
running with 1.5.1, it works fine.<br class=3D"">When running with =
1.7.1, it does not even parse the file<br class=3D""></blockquote><br =
class=3D"">Details? &nbsp;Otherwise, you'll only get guesses :-(<br =
class=3D""><br class=3D""><blockquote type=3D"cite" class=3D""><br =
class=3D"">Has anyone encountered this or is there a description of the =
changes in this area.<br class=3D""><br class=3D"">Thanks in advance,<br =
class=3D"">=E2=80=94Walt<br class=3D""><br class=3D""></blockquote><br =
class=3D"">--&nbsp;<br =
class=3D"">------------------------------------------------------------<br=
 class=3D"">Gary Thomas =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;| &nbsp;Consulting for the<br class=3D"">MLB =
Associates =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;| &nbsp;&nbsp;&nbsp;Embedded world<br =
class=3D"">------------------------------------------------------------<br=
 class=3D""></body></html>=

--Apple-Mail=_6671CF5F-A471-4F47-8691-C1E11E07AFD6--
