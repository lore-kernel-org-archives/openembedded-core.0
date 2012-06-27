Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SjnuD-0005iW-9c
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jun 2012 10:47:21 +0200
Received: from mail-ey0-f180.google.com ([209.85.215.180])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 27 Jun 2012 01:36:22 -0700
Received: by eaai12 with SMTP id i12so227430eaa.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jun 2012 01:36:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=date:from:to:message-id:in-reply-to:references:subject:x-mailer
	:mime-version:content-type:x-gm-message-state;
	bh=5GTCo5xAhqtyIRhC84z4jUhSdXt9DbFOM5gEGYbVhec=;
	b=I2X8oyCS/xl+Un66q/yfO+op4CpqAnbtg4GccHnYUa7NnSVYs7Lz77gC1u6Y76NYyG
	GY3+BG1OP1PjpVnSfyDOk/5Br3ONybxFA9jWz/LrefHcFRJHxW09M0YsBJhdVkQWm1qr
	uTTtPZIATjlb0iK8do/EQpuPKBKzjOWL5lMx2fCMTt6dAUwrNWaCoPf9v31A+N/vtP0H
	LBpQWxCkJGsiKKbrPcwqzv/Oox1Rd5nuaaE6D4lJD154HSMhpqgX4YAjcMhw3b0QeXEM
	XaZGyTM6mUZOlPWbNwU/NElQbJ1VFsj/aXiZd6oshWAreJPV6LZcPvDFBWC3H7EAIGn3
	HOJg==
Received: by 10.14.22.6 with SMTP id s6mr3995297ees.154.1340786180275;
	Wed, 27 Jun 2012 01:36:20 -0700 (PDT)
Received: from [192.168.1.5] (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id h53sm156753200eea.1.2012.06.27.01.36.16
	(version=SSLv3 cipher=OTHER); Wed, 27 Jun 2012 01:36:19 -0700 (PDT)
Date: Wed, 27 Jun 2012 09:36:14 +0100
From: Ross Burton <ross.burton@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <2790F11E14324B8FA3F9EF5D382B2DC4@intel.com>
In-Reply-To: <B881EA27-5FFA-434C-BF87-9C6A0DA5A47D@dominion.thruhere.net>
References: <CAJTo0LYRGSkOGOV04C+Pb3ypi7JvbbjC7UJY-Yxywk12FQusaQ@mail.gmail.com>
	<B881EA27-5FFA-434C-BF87-9C6A0DA5A47D@dominion.thruhere.net>
X-Mailer: sparrow 1.3 (build 495)
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQk4dYg+4gXEzwmVB3IWEeZLt0q+FCA/cSRMrNonNvJ6Ew/2b5YMi2lQPmCXKc51QhwHD+R/
Subject: Re: [RFC] webkit-gtk upgrade
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
X-List-Received-Date: Wed, 27 Jun 2012 08:47:21 -0000
Content-Type: multipart/alternative; boundary="4feac5fe_3d1b58ba_3f17"

--4feac5fe_3d1b58ba_3f17
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Poky, but should rebase with a fast-forward.

Actually, it's probably based on my gconf branch. I'm away from my work machines now do can't check but the relevant changes can easily be cherry-picked. 

Ross-- 
Ross Burton
Sent with Sparrow (http://www.sparrowmailapp.com/?sig)


On Wednesday, 27 June 2012 at 08:21, Koen Kooi wrote:

> 
> Op 27 jun. 2012, om 08:40 heeft Burton, Ross het volgende geschreven:
> 
> > Hi,
> > 
> > In the git branch poky-contrib/ross/webkit I've upgraded webkit-gtk
> > from a 1.7.1-ish git snapshot to the 1.8.1 tarball. I've tested that
> > web builds and Midori (from meta-oe) works, although obviously more
> > testing is needed -- both users of the library and architectures.
> > 
> > I'm going away for a week now so if interested parties could test this
> > it would be much appreciated!
> > 
> 
> 
> Is that branch against oe-core or poky?
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> 



--4feac5fe_3d1b58ba_3f17
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline


    <div id=3D=22reply-content=22>
        Poky, but should rebase with a fast-forward.</div><div id=3D=22re=
ply-content=22><br></div><div id=3D=22reply-content=22>Actually, it's pro=
bably based on my gconf branch. I'm away from my work machines now do can=
't check but the relevant changes can easily be cherry-picked.</div>
    <div id=3D=223974943D9147415881=469EA4439=46C=46BCE=22><div><br></div=
><div>Ross</div>--&nbsp;<br>Ross Burton<br><div>Sent with <a href=3D=22ht=
tp://www.sparrowmailapp.com/=3Fsig=22>Sparrow</a></div><div><br></div></d=
iv>
    =20
    <p style=3D=22color: =23A0A0A8;=22>On Wednesday, 27 June 2012 at 08:2=
1, Koen Kooi wrote:</p>
    <blockquote type=3D=22cite=22 style=3D=22border-left-style:solid;bord=
er-width:1px;margin-left:0px;padding-left:10px;=22>
        <div id=3D=22quoted-message-content=22><div><div><br></div><div>O=
p 27 jun. 2012, om 08:40 heeft Burton, Ross het volgende geschreven:</div=
><div><br></div><blockquote type=3D=22cite=22><div><div>Hi,</div><div><br=
></div><div>In the git branch poky-contrib/ross/webkit I've upgraded webk=
it-gtk</div><div>from a 1.7.1-ish git snapshot to the 1.8.1 tarball.  I'v=
e tested that</div><div>web builds and Midori (from meta-oe) works, altho=
ugh obviously more</div><div>testing is needed -- both users of the libra=
ry and architectures.</div><div><br></div><div>I'm going away for a week =
now so if interested parties could test this</div><div>it would be much a=
ppreciated=21</div></div></blockquote><div><br></div><div>Is that branch =
against oe-core or poky=3F</div><div><br></div><div>=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F</div><div>Openembedded-core=
 mailing list</div><div>Openembedded-core=40lists.openembedded.org</div><=
div>http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=
</div></div></div>
        =20
        =20
        =20
        =20
    </blockquote>
    =20
    <div>
        <br>
    </div>

--4feac5fe_3d1b58ba_3f17--
