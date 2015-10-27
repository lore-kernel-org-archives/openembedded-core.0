Return-Path: <Noor_Ahsan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 4924A75CC2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Oct 2015 14:28:04 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Zr5EK-0004M0-Pv from Noor_Ahsan@mentor.com ;
	Tue, 27 Oct 2015 07:28:05 -0700
Received: from EU-MBX-03.mgc.mentorg.com ([169.254.2.245]) by
	SVR-IES-FEM-02.mgc.mentorg.com ([137.202.0.106]) with mapi id
	14.03.0224.002; Tue, 27 Oct 2015 14:28:04 +0000
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: "ed.bartosh@linux.intel.com" <ed.bartosh@linux.intel.com>
Thread-Topic: U-boot file is being removed when image-recipe is rebuild
	which uses wic.bz2
Thread-Index: AQHREL0SeK+5Z1memUCtZHGQFzlVr55/ZTtQ
Date: Tue, 27 Oct 2015 14:28:02 +0000
Message-ID: <365E1805BC95084CBE82381A0B8699940121B4E446@EU-MBX-03.mgc.mentorg.com>
References: <20151027134031.GA12305@linux.intel.com>
In-Reply-To: <20151027134031.GA12305@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.76]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: U-boot file is being removed when image-recipe is rebuild which uses wic.bz2
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
X-List-Received-Date: Tue, 27 Oct 2015 14:28:07 -0000
X-Groupsio-MsgNum: 72680
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_002_365E1805BC95084CBE82381A0B8699940121B4E446EUMBX03mgcmen_"

--_002_365E1805BC95084CBE82381A0B8699940121B4E446EUMBX03mgcmen_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I have identified the issue and sent and RFC on mailing list. One feedback =
I received was replace dd_cmd =3D "cp src dst" with dd_cmd =3D "cp %s %s" %=
 (src, dst) which was and off sight from me. I need more detailed review of=
 it.

Noor

-----Original Message-----
From: Ed Bartosh [mailto:ed.bartosh@linux.intel.com]=20
Sent: Tuesday, October 27, 2015 6:41 PM
To: Ahsan, Noor
Cc: openembedded-core@lists.openembedded.org
Subject: Re: U-boot file is being removed when image-recipe is rebuild whic=
h uses wic.bz2

Hi Noor,

Sorry for delay. I missed your e-mail somehow.

Can you please show your recipe, wks file and the details of your build con=
figuration(MACHINE, bblayers, etc) ?

---
Regards,
Ed

--_002_365E1805BC95084CBE82381A0B8699940121B4E446EUMBX03mgcmen_
Content-Type: message/rfc822
Content-Disposition: attachment;
	creation-date="Tue, 27 Oct 2015 14:28:01 GMT";
	modification-date="Tue, 27 Oct 2015 14:28:01 GMT"

Received: from SVR-ORW-FEM-06.mgc.mentorg.com (147.34.97.120) by
 SVR-IES-FEM-05.mgc.mentorg.com (137.202.0.112) with Microsoft SMTP Server
 (TLS) id 14.3.224.2; Thu, 22 Oct 2015 11:14:45 +0100
Received: from relay1.mentorg.com (147.34.91.1) by
 SVR-ORW-FEM-06.mgc.mentorg.com (147.34.97.120) with Microsoft SMTP Server
 (TLS) id 14.3.224.2; Thu, 22 Oct 2015 03:14:42 -0700
Received: from esa1.mentor.iphmx.com ([68.232.129.153])	by relay1.mentorg.com
 with esmtps (TLSv1:DHE-RSA-AES256-SHA:256)	id 1ZpCtN-0005m2-KY from
 openembedded-core-bounces@lists.openembedded.org 	for Noor_ahsan@mentor.com;
 Thu, 22 Oct 2015 03:14:41 -0700
Received: from mail.openembedded.org ([140.211.169.62])  by
 esa1.mentor.iphmx.com with ESMTP; 22 Oct 2015 02:14:40 -0800
Received: from layers.openembedded.org (localhost [127.0.0.1])	by
 mail.openembedded.org (Postfix) with ESMTP id 87B3075D22;	Thu, 22 Oct 2015
 10:14:24 +0000 (UTC)
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])	by
 mail.openembedded.org (Postfix) with ESMTP id C7D7F770F3	for
 <openembedded-core@lists.openembedded.org>;	Thu, 22 Oct 2015 10:14:15 +0000
 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-04.mgc.mentorg.com)	by relay1.mentorg.com with esmtp 	id
 1ZpCsw-0005fv-UL from Noor_Ahsan@mentor.com ;	Thu, 22 Oct 2015 03:14:15 -0700
Received: from EU-MBX-01.mgc.mentorg.com ([169.254.1.18]) by
	SVR-IES-FEM-04.mgc.mentorg.com ([137.202.0.110]) with mapi id	14.03.0224.002;
 Thu, 22 Oct 2015 11:14:02 +0100
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFC] rawcopy.py: Copy source file in image creation
 build folder
Thread-Topic: [RFC] rawcopy.py: Copy source file in image creation build
 folder
Thread-Index: AQHRDBpMmQJRJH2xI0egLkJjuEGttZ53TCyA
Sender: "openembedded-core-bounces@lists.openembedded.org"
	<openembedded-core-bounces@lists.openembedded.org>
Date: Thu, 22 Oct 2015 10:14:02 +0000
Message-ID: <365E1805BC95084CBE82381A0B86999401095FB9D1@EU-MBX-01.mgc.mentorg.com>
References: <1445443468-8394-1-git-send-email-noor_ahsan@mentor.com>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
In-Reply-To: <1445443468-8394-1-git-send-email-noor_ahsan@mentor.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Exchange-Organization-AuthMechanism: 10
X-MS-Exchange-Organization-AuthSource: SVR-ORW-FEM-06.mgc.mentorg.com
X-MS-Has-Attach: 
X-Auto-Response-Suppress: All
X-MS-TNEF-Correlator: 
list-post: <mailto:openembedded-core@lists.openembedded.org>
list-archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
errors-to: openembedded-core-bounces@lists.openembedded.org
list-id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
x-mailman-version: 2.1.12
x-beenthere: openembedded-core@lists.openembedded.org
x-ironport-av: E=Sophos;i="5.15,747,1432627200";    d="scan'208";a="2260884"
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D8C20A934FB5F84D88CC7D9B78268075@mentor.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0



-----Original Message-----
From: Ahsan, Noor
Sent: Wednesday, October 21, 2015 9:04 PM
To: openembedded-core@lists.openembedded.org
Cc: Ahsan, Noor
Subject: [RFC] rawcopy.py: Copy source file in image creation build folder

From: Noor <noor_ahsan@mentor.com>

* When a file is given using --sourceparams then wic directly use that file
  instead of copying them to build folder. At time of assmebling it os.rena=
me
  is called which rename all the files to name. In that process the origina=
l
  file get renamed. When image recipe is rebuilt then wic complains about
  missing file which renamed in previous build.

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 scripts/lib/wic/plugins/source/rawcopy.py |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/pl=
ugins/source/rawcopy.py
index f0691ba..f17da27 100644
--- a/scripts/lib/wic/plugins/source/rawcopy.py
+++ b/scripts/lib/wic/plugins/source/rawcopy.py
@@ -74,6 +74,10 @@ class RawCopyPlugin(SourcePlugin):
             dd_cmd =3D "dd if=3D%s of=3D%s ibs=3D%s skip=3D1 conv=3Dnotrun=
c" % \
                     (src, dst, source_params['skip'])
             exec_cmd(dd_cmd)
+        else:
+            dst =3D os.path.join(cr_workdir, source_params['file'])
+            dd_cmd =3D "cp src dst"
+            exec_cmd(dd_cmd)


dd_cmd will be replaced by cp_cmd but I need review of all impact of this s=
o that I can send proper patch.


         # get the size in the right units for kickstart (kB)
         du_cmd =3D "du -Lbks %s" % dst
--
1.7.9.5

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

--_002_365E1805BC95084CBE82381A0B8699940121B4E446EUMBX03mgcmen_--
