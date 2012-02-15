Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <brandon@rascalmicro.com>) id 1RxoIS-0001VI-13
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Feb 2012 00:30:00 +0100
Received: by iaby12 with SMTP id y12so2248500iab.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2012 15:21:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.42.46.76 with SMTP id j12mr137537icf.22.1329348106877; Wed, 15
	Feb 2012 15:21:46 -0800 (PST)
Received: by 10.231.15.73 with HTTP; Wed, 15 Feb 2012 15:21:46 -0800 (PST)
X-Originating-IP: [146.115.15.122]
Date: Wed, 15 Feb 2012 18:21:46 -0500
Message-ID: <CA+b4E8wdD1bQN77Sg=ew+-AbHtyrn4N87Ud6+BwCFdW56BO_kQ@mail.gmail.com>
From: Brandon Stafford <brandon@rascalmicro.com>
To: openembedded-core@lists.openembedded.org
X-Gm-Message-State: ALoCoQldZd9mcIuv6+MYuxsRje97Tn6EOSSNpbb5nRn798aCsDXQ4URLjSk75wWXqK3e9TVH2BrH
Subject: Problem building core-image-basic: Cannot create symlink from ./var/run to 'volatile/run'
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
X-List-Received-Date: Wed, 15 Feb 2012 23:30:00 -0000
Content-Type: multipart/alternative; boundary=90e6ba614ce0b1790104b908f972

--90e6ba614ce0b1790104b908f972
Content-Type: text/plain; charset=ISO-8859-1

Hi all,

In trying to build core-image-basic for qemuarm, I ran into an error:
extract_archive:
Cannot create symlink from ./var/run to 'volatile/run': File exists.

(The full error message is posted here: http://pastebin.com/QPic3uHx )

Though this seems very similar to a post from a few months ago, I am not
sure how to go about debugging it:
http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-October/035409.html

Can other folks build core-image-basic successfully? Any suggestions about
how to determine which recipe is attempting to make the symlink?

From what I can tell, the culprits could be meta/files/fs-perms.txt
or meta/recipes-core/base-files/base-files_3.0.14.bb, but I'm not sure
where to go from there. If it helps, I am able to build core-image-minimal
successfully.

Thanks,
Brandon

-- 
Brandon Stafford
Rascal Micro: small computers for art and science
Somerville, MA, USA

--90e6ba614ce0b1790104b908f972
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi all,<div><br></div><div>In trying to build core-image-basic for qemuarm,=
 I ran into an error:=A0<span style=3D"line-height:21px;font-size:12px;font=
-family:Consolas,Menlo,Monaco,&#39;Lucida Console&#39;,&#39;Liberation Mono=
&#39;,&#39;DejaVu Sans Mono&#39;,&#39;Bitstream Vera Sans Mono&#39;,monospa=
ce,serif">extract_archive: Cannot create symlink from .</span><span style=
=3D"line-height:21px;font-size:12px;font-family:Consolas,Menlo,Monaco,&#39;=
Lucida Console&#39;,&#39;Liberation Mono&#39;,&#39;DejaVu Sans Mono&#39;,&#=
39;Bitstream Vera Sans Mono&#39;,monospace,serif;font-weight:bold">/</span>=
<span style=3D"line-height:21px;font-size:12px;font-family:Consolas,Menlo,M=
onaco,&#39;Lucida Console&#39;,&#39;Liberation Mono&#39;,&#39;DejaVu Sans M=
ono&#39;,&#39;Bitstream Vera Sans Mono&#39;,monospace,serif">var</span><spa=
n style=3D"line-height:21px;font-size:12px;font-family:Consolas,Menlo,Monac=
o,&#39;Lucida Console&#39;,&#39;Liberation Mono&#39;,&#39;DejaVu Sans Mono&=
#39;,&#39;Bitstream Vera Sans Mono&#39;,monospace,serif;font-weight:bold">/=
</span><span style=3D"line-height:21px;font-size:12px;font-family:Consolas,=
Menlo,Monaco,&#39;Lucida Console&#39;,&#39;Liberation Mono&#39;,&#39;DejaVu=
 Sans Mono&#39;,&#39;Bitstream Vera Sans Mono&#39;,monospace,serif">run to=
=A0</span><span style=3D"line-height:21px;color:rgb(255,0,0);font-size:12px=
;font-family:Consolas,Menlo,Monaco,&#39;Lucida Console&#39;,&#39;Liberation=
 Mono&#39;,&#39;DejaVu Sans Mono&#39;,&#39;Bitstream Vera Sans Mono&#39;,mo=
nospace,serif">&#39;volatile/run&#39;</span><span style=3D"line-height:21px=
;font-size:12px;font-family:Consolas,Menlo,Monaco,&#39;Lucida Console&#39;,=
&#39;Liberation Mono&#39;,&#39;DejaVu Sans Mono&#39;,&#39;Bitstream Vera Sa=
ns Mono&#39;,monospace,serif">: File exists.</span></div>


<br>(The full error message is posted here:=A0<a href=3D"http://pastebin.co=
m/QPic3uHx" target=3D"_blank">http://pastebin.com/QPic3uHx</a> )<div><div><=
br></div><div>Though this seems very similar to a post from a few months ag=
o, I am not sure how to go about debugging it: <a href=3D"http://lists.linu=
xtogo.org/pipermail/openembedded-devel/2011-October/035409.html" target=3D"=
_blank">http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-Octobe=
r/035409.html</a></div>

<div><br></div><div>Can other folks build core-image-basic successfully? An=
y suggestions about how to determine which recipe is attempting to make the=
 symlink?</div><div><br></div><div>From what I can tell, the culprits could=
 be=A0meta/files/fs-perms.txt or=A0meta/recipes-core/base-files/<a href=3D"=
http://base-files_3.0.14.bb">base-files_3.0.14.bb</a>, but I&#39;m not sure=
 where to go from there. If it helps, I am able to build core-image-minimal=
 successfully.</div>
<div><br></div><div>Thanks,</div><div>Brandon</div><div>
<br></div>-- <br><div>Brandon Stafford</div>
<div>Rascal Micro: small computers for art and science</div><div>Somerville=
, MA, USA</div><br>
</div>

--90e6ba614ce0b1790104b908f972--
