Return-Path: <drew_moseley@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 649456FE76
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 22:28:35 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1XA51Y-0003F1-On from drew_moseley@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Jul 2014 15:28:36 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 23 Jul 2014 15:28:36 -0700
Received: from NA-MBX-03.mgc.mentorg.com ([fe80::9a:1569:df57:45b8]) by
	SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) with mapi id
	14.02.0247.003; Wed, 23 Jul 2014 15:28:36 -0700
From: "Moseley, Drew" <drew_moseley@mentor.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] libomxil-0.9.3: Updated CORE_NAME to drop .0
	extension.
Thread-Index: AQHPprnH6XslJANmyE2/UMpdcrLggZuussaA
Date: Wed, 23 Jul 2014 22:28:35 +0000
Message-ID: <D4601E2D-F5E9-4AD3-AB6A-A67B0D4FD4E4@mentor.com>
References: <1406149462-14828-1-git-send-email-drew_moseley@mentor.com>
In-Reply-To: <1406149462-14828-1-git-send-email-drew_moseley@mentor.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.34.91.1]
MIME-Version: 1.0
X-OriginalArrivalTime: 23 Jul 2014 22:28:36.0644 (UTC)
	FILETIME=[71E20640:01CFA6C5]
Subject: Re: [PATCH] libomxil-0.9.3: Updated CORE_NAME to drop .0	extension.
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
X-List-Received-Date: Wed, 23 Jul 2014 22:28:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <727014FE9F70734492BDC67AE3AC3227@mentor.com>
Content-Transfer-Encoding: quoted-printable

On Jul 23, 2014, at 5:04 PM, Drew Moseley <drew_moseley@mentor.com> wrote:
> As a result of commit 0ef3734c2f279bf463ba4d1aef5241cd4882d483 the ".0"
> extension for GSTREAMER_1_0_OMX_CORE_NAME is no longer needed.

Ignore this patch.  I think the previous fix went too far in adding the avo=
id-version option.  I'm working on a proper fix to only avoid the versionin=
g on the ${libdir}/bellagio/* files.

Drew


