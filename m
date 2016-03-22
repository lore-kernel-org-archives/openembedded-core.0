Return-Path: <brad.mouring@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id BA508601F6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 23:18:06 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u2MNI6KW001234; Tue, 22 Mar 2016 18:18:06 -0500
Received: from ni.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with SMTP id 2016032218180626-111015 ;
	Tue, 22 Mar 2016 18:18:06 -0500 
Received: by ni.com (sSMTP sendmail emulation); Tue, 22 Mar 2016 18:18:05 -0500
From: Brad Mouring <brad.mouring@ni.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Date: Tue, 22 Mar 2016 18:17:58 -0500
Message-Id: <1458688681-31394-1-git-send-email-brad.mouring@ni.com>
X-Mailer: git-send-email 2.7.3
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 03/22/2016 06:18:07 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 03/22/2016 06:18:07 PM,
	Serialize complete at 03/22/2016 06:18:07 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-03-22_09:, , signatures=0
Subject: [PATCH 0/3][For Fido] Backport busybox zcip fix
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
X-List-Received-Date: Tue, 22 Mar 2016 23:18:06 -0000


During some testing of zcip as provided by busybox 1.23.x, it was
discovered that there was a false conflict detected and therefore
needless renegotiation of a LL address.

Checking upstream, it seems that this was fixed in 1.24+. This
patch set aims to backport the fix to Fido.

Additionally, while checking the _git.bb, it was discovered that
the fetch of this normally-ignored recipe is wrong (the commit
called for in the recipe is not on master). This is corrected and
the patch applied to that recipe as well.

