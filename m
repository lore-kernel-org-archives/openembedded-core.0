Received: from smtp24.4emm.com ([69.18.222.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1Qo9Tu-0004BL-Av
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 09:33:38 +0200
Received: from MBX20.4emm.local ([fe80::382d:f6d3:f4de:a97f]) by
	HUB24.4emm.local ([::1]) with mapi id 14.01.0289.001; Tue, 2 Aug 2011
	03:24:11 -0400
From: James Limbouris <james@digitalmatter.com.au>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: erratic failure of pseudo
Thread-Index: AcxQ5AdgoKX0fNmvSF+eAAH9XHel8g==
Date: Tue, 2 Aug 2011 07:28:07 +0000
Message-ID: <840A81C1B782724A8EB52725BD519EFF181E0B@MBX20.4emm.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [203.59.132.158]
MIME-Version: 1.0
Subject: erratic failure of pseudo
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
X-List-Received-Date: Tue, 02 Aug 2011 07:33:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I've just switched to oe-core from -dev, and I'm finding that my root image=
s are showing incorrect permissions on files, randomly. From one build to t=
he next, different subsets of files and folders end up owned by 1000:1000, =
instead of root:root. They aren't strictly grouped by package - just random=
 files, different every time.

Has anyone else noticed this behaviour? Does anyone have any advice on how =
to go about debugging? It might help to look at the pseudo db, and see if t=
he permissions are in there - can anyone tell me where it is? I find an emp=
ty pseudo folder in the work folder after do_rm_work, but it is not there i=
f I do a bitbake -c build image-xxx.
=A0=A0
Regards
James Limbouris



