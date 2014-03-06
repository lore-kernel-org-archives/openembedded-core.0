Return-Path: <andreea.b.proca@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id F22206E7CC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 11:45:39 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 06 Mar 2014 03:41:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,599,1389772800"; d="scan'208";a="467675223"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by orsmga001.jf.intel.com with ESMTP; 06 Mar 2014 03:45:39 -0800
Received: from irsmsx153.ger.corp.intel.com (163.33.192.75) by
	IRSMSX104.ger.corp.intel.com (163.33.3.159) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Thu, 6 Mar 2014 11:45:35 +0000
Received: from irsmsx106.ger.corp.intel.com ([169.254.8.177]) by
	IRSMSX153.ger.corp.intel.com ([169.254.9.61]) with mapi id
	14.03.0123.003; Thu, 6 Mar 2014 11:45:35 +0000
From: "Proca, Andreea B" <andreea.b.proca@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: error-report-web django-nvd3 version
Thread-Index: AQHPONxje1OXDGKaOkGsfzsKFWX7jJrT8TtQ
Date: Thu, 6 Mar 2014 11:44:54 +0000
Message-ID: <C76456D50C459F418509335BC413076F169032A3@IRSMSX106.ger.corp.intel.com>
References: <20140306013131.GE26981@jama>
In-Reply-To: <20140306013131.GE26981@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: error-report-web django-nvd3 version
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
X-List-Received-Date: Thu, 06 Mar 2014 11:45:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Martin,

I should have been more specific about the versions, sorry.=20
I've updated the README, it needs django-nvd3 0.1.11 and python-nvd3 0.6.0.

I usually install those on my Ubuntu host using pip.=20

Regards,
Andreea

-----Original Message-----
From: Martin Jansa [mailto:martin.jansa@gmail.com]=20
Sent: Thursday, March 06, 2014 3:32 AM
To: Proca, Andreea B
Cc: openembedded-core@lists.openembedded.org
Subject: error-report-web django-nvd3 version

Hi,

can you be more specific about django-nvd3 version required by error-report=
-web?
http://git.yoctoproject.org/cgit/cgit.cgi/error-report-web/tree/README

with 0.6.* it was complaining about missing kw_args param in load_chart cal=
ls, older versions were complaining about other changes.

I'm testing it (currently without graphs) in order to extend it to collect =
some build metrics and statistics from our builds (like every jenkins build=
 and very local developer build will upload back description of HW, build t=
imes and other metrics so we can better evaluate icecc, sstate reuse ratio =
etc).

If something like that would be useful for upstream I can eventually contri=
bute it back.

I've also updated the .bbclass to read all "configuration" from bb data and=
 to upload the report after every build (sort of like tinderbox, oestats bb=
class worked), that way is easier for us to globally enable it for all buil=
ds in our distro config without any interaction from developers.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

