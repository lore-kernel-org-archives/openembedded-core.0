Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>)
	id 1T21qF-0003cF-B9; Thu, 16 Aug 2012 17:18:35 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7GF6aVE001434
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 16 Aug 2012 08:06:36 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.1.187]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.02.0309.002;
	Thu, 16 Aug 2012 08:06:35 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [oe-commits] Jackie Huang : gdk-pixbuf: fix the postinstall
	script failure when no icon is installed
Thread-Index: AQHNe6ymj1CVAbBWMkuLm2iu1FzLGpdcfhGCgAB41YD//43f+A==
Date: Thu, 16 Aug 2012 15:06:35 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA576F7B6D@ALA-MBA.corp.ad.wrs.com>
References: <20120815133202.50B6D10218@opal>
	<20120816103308.GA32088@jama.jama.net>
	<20120816124239.GC32088@jama.jama.net>
	<1B858668EC6A94408DCA5225FDFA85AA576F7B28@ALA-MBA.corp.ad.wrs.com>,
	<20120816143559.GD32088@jama.jama.net>
In-Reply-To: <20120816143559.GD32088@jama.jama.net>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.17.88]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Zhao,
	Zhenfeng" <Zhenfeng.Zhao@windriver.com>,
	"openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] Jackie Huang : gdk-pixbuf: fix the postinstall script failure when no icon is installed
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
X-List-Received-Date: Thu, 16 Aug 2012 15:18:36 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>=0A=
>On Thu, Aug 16, 2012 at 02:30:51PM +0000, Huang, Jie (Jackie) wrote:=0A=
>> >=0A=
>> >On Thu, Aug 16, 2012 at 12:33:08PM +0200, Martin Jansa wrote:=0A=
>> >> On Wed, Aug 15, 2012 at 01:32:02PM +0000, git@git.openembedded.org wr=
ote:=0A=
>> >> > Module: openembedded-core.git=0A=
>> >> > Branch: master=0A=
>> >> > Commit: 1d4fbe4761d3d97e3c4b6e894719ee41b21559b2=0A=
>> >> > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3D=
commit;h=3D1d4fbe4761d3d97e3c4b6e894719ee41b21559b2=0A=
>> >> >=0A=
>> >> > Author: Jackie Huang <jackie.huang@windriver.com>=0A=
>> >> > Date:   Thu Aug  9 10:30:30 2012 +0800=0A=
>> >> >=0A=
>> >> > gdk-pixbuf: fix the postinstall script failure when no icon is inst=
alled=0A=
>> >> >=0A=
>> >> > If gtk+ is added to core-image-minimal, postinstall script failed o=
n boot:=0A=
>> >> >=0A=
>> >> > Running postinst /etc/rpm-postinsts/104...=0A=
>> >> > gtk-update-icon-cache: No theme index file.=0A=
>> >> > ERROR: postinst /etc/rpm-postinsts/104 failed.=0A=
>> >> >=0A=
>> >> > This patch fixed the postinstall script to check for the icon=0A=
>> >> > file first and not run the gtk-update-icon-cache if no icon=0A=
>> >> > is installed.=0A=
>> >> >=0A=
>> >> > [YOCTO #2905]=0A=
>> >> >=0A=
>> >> > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>=0A=
>> >> > Signed-off-by: Saul Wold <sgw@linux.intel.com>=0A=
>> >>=0A=
>> >>=0A=
>> >> Even with this patch I get:=0A=
>> >> Configuring gdk-pixbuf-loader-png.=0A=
>> >> gtk-update-icon-cache: No theme index file.=0A=
>> >> Configuring gdk-pixbuf-loader-jpeg.=0A=
>> >> gtk-update-icon-cache: No theme index file.=0A=
>> >> Configuring gdk-pixbuf-loader-xpm.=0A=
>> >> gtk-update-icon-cache: No theme index file.=0A=
>> >> Configuring gdk-pixbuf-loader-gif.=0A=
>> >> gtk-update-icon-cache: No theme index file.=0A=
>> >> Collected errors:=0A=
>> >>  * pkg_run_script: package "gdk-pixbuf-loader-png" postinst script=0A=
>> >>  * returned status 1.=0A=
>> >>  * opkg_configure: gdk-pixbuf-loader-png.postinst returned 1.=0A=
>> >>  * pkg_run_script: package "gdk-pixbuf-loader-jpeg" postinst script=
=0A=
>> >>  * returned status 1.=0A=
>> >>  * opkg_configure: gdk-pixbuf-loader-jpeg.postinst returned 1.=0A=
>> >>  * pkg_run_script: package "gdk-pixbuf-loader-xpm" postinst script=0A=
>> >>  * returned status 1.=0A=
>> >>  * opkg_configure: gdk-pixbuf-loader-xpm.postinst returned 1.=0A=
>> >>  * pkg_run_script: package "gdk-pixbuf-loader-gif" postinst script=0A=
>> >>  * returned status 1.=0A=
>> >>  * opkg_configure: gdk-pixbuf-loader-gif.postinst returned 1.=0A=
>> >=0A=
>> >This problem is caused by=0A=
>> >openembedded-core/meta/recipes-graphics/xcursor-transparent-theme/xcurs=
or-transparent-theme_0.1.1.bb=0A=
>> >which does not provide index.theme file=0A=
>> >=0A=
>>=0A=
>> Well, in my case, there is no icon installed so there is on ${datadir}/i=
cons at all.=0A=
>=0A=
>So it's fine to break postinst for everyone else who has=0A=
=0A=
This fix is for the case when there is no icon/theme installed. When we fou=
nd the bug,=0A=
the postinst was calling the gtk-update-icon-cache for the hicolor theme wh=
ich is not installed.=0A=
=0A=
>xcursor-transparent-theme or are you going to fix that?=0A=
=0A=
For xcursor-transparent-theme not providing the index.theme file, yeah it's=
 really a problem,=0A=
I can fix that, but maybe we should open another bug for it?=0A=
=0A=
Thanks,=0A=
Jackie=0A=
=0A=
>=0A=
>Thanks,=0A=
>=0A=
>>=0A=
>> Thanks,=0A=
>> Jackie=0A=
>>=0A=
>> >and commit message of this change should be something like=0A=
>> >gdk-pixbuf: call gtk-update-icon-cache for each subdir of ${datadir}/ic=
ons=0A=
>> >not=0A=
>> >gdk-pixbuf: fix the postinstall script failure when no icon is installe=
d=0A=
>> >=0A=
>> >Cheers,=0A=
>> >=0A=
>> >> > -test -x ${bindir}/gtk-update-icon-cache && gtk-update-icon-cache  =
-q ${datadir}/icons/hicolor=0A=
>> >> > +if [ -x ${bindir}/gtk-update-icon-cache ] && [ -d ${datadir}/icons=
 ]; then=0A=
>> >> > +    for icondir in /usr/share/icons/*; do=0A=
>> >> > +        if [ -d ${icondir} ]; then=0A=
>> >> > +            gtk-update-icon-cache -q ${icondir}=0A=
>> >> > +        fi=0A=
>> >> > +    done=0A=
>> >> > +fi=0A=
>> >> >  }=0A=
>> >> >=0A=
>> >> >  PACKAGES_DYNAMIC +=3D "gdk-pixbuf-loader-*"=0A=
>> >> >=0A=
>> >> >=0A=
>> >> > _______________________________________________=0A=
>> >> > Openembedded-commits mailing list=0A=
>> >> > Openembedded-commits@lists.openembedded.org=0A=
>> >> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-co=
mmits=0A=
>> >>=0A=
>> >> --=0A=
>> >> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com=0A=
>> >=0A=
>> >=0A=
>> >=0A=
>> >--=0A=
>> >Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com=0A=
>> >=0A=
>=0A=
>--=0A=
>Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com=0A=
>=0A=


