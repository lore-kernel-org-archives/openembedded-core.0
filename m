Return-Path: <prvs=4303c6e2d1=michael.davis@essvote.com>
Received: from m2.essvote.com (m2.essvote.com [66.37.226.14])
	by mail.openembedded.org (Postfix) with ESMTP id EFC2871A8E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 15:02:30 +0000 (UTC)
X-AuditID: 0a00029b-723ff70000003f55-0b-59132b841c17
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by m2.essvote.com (Symantec Messaging Gateway) with SMTP id
	36.42.16213.48B23195; Wed, 10 May 2017 10:02:30 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Wed, 10 May 2017 10:02:28 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [RFC PATCH 00/10] Add openssl 1.1
Thread-Index: AQHSyZefJriOROMie0iYjBQbJx3PdaHtqNpw
Date: Wed, 10 May 2017 15:02:27 +0000
Message-ID: <655290B7709079438B7932553958E60D16D2C5FA@ESS-EX01.essvote.corp.local>
References: <cover.1494425038.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1494425038.git.alexander.kanavin@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.20.77]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFLMWRmVeSWpSXmKPExsWyRiBPQ7dNWzjS4McbM4v/j7exWdz5+Y7d
	gclj3slAj3MbVzAGMEVx2yQllpQFZ6bn6dslcGc82nGFqWAqY8XNK5sYGxgLuhg5OSQETCT+
	r7vF2sXIxSEkcJRR4tOCO2wQzixGiW97v7KDVLEJGEmcu76JESQhIjCFUeLvsbmMIAlhAQuJ
	Y/NfgRWJCFhKvNh+iBHCNpK4MP0ZC4jNIqAqsefnObAaXoEgiZsLZoPVCAm4SHw42g1Wwyng
	KtH/eTJYnFFATOL7qTVMIDazgLjErSfzmSBOFZBYsuc8M4QtKvHy8T9WCFtO4l1TGytEvY7E
	gt2f2CBsbYllC18zQ+wVlDg58wnLBEaRWUjGzkLSMgtJyywkLQsYWVYx8uUa6aUWF5fll6Tq
	JefnbmIExgAXA9PsHYx7JjgcYhTgYFTi4b3AJxwpxJpYVlyZe4hRmoNFSZz32UrmSCGB9MSS
	1OzU1ILUovii0pzU4kOMTBychxglOLikRIpT81JSixJLSzLiQXEVXwyMLKkGRq+/qldd3e9P
	1+CL9n/3d9nT5bmztCMtrTd8kjbpN93+Z+9UpZPF1/QPBH2enHDj+YeTfb6+cxR6/jbOn8Iy
	ecGZb1M2Fi5qy1/RvyGyq0vhn8hFZ2ttPgalHQeTnFzm77qYvt9Cac+dn+Gqk1OLG35VMCso
	O5/heC/Tspjr5vYLwksNnlY/YFRiKc5INNRiLipOBABWpyQpfQIAAA==
Subject: Re: [RFC PATCH 00/10] Add openssl 1.1
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
X-List-Received-Date: Wed, 10 May 2017 15:02:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Won't this cause a lot of issues for those of us that require FIPS?
I don't think 1.1 is expected to get FIPS support for some time.

--
Mike


