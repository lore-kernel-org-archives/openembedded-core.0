Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0A5EC65CBF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 21:15:54 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	tA9LFskl016510 for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Nov 2015 15:15:54 -0600
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015110915155400-1841230 ;
	Mon, 9 Nov 2015 15:15:54 -0600 
From: Richard Tollerton <rich.tollerton@ni.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>,
	openembedded-core@lists.openembedded.org
In-Reply-To: <1447077707-31620-1-git-send-email-adrian.ratiu@ni.com>
References: <1447077707-31620-1-git-send-email-adrian.ratiu@ni.com>
User-Agent: Notmuch/0.20.2 (http://notmuchmail.org) Emacs/24.5.2
	(x86_64-unknown-linux-gnu)
Date: Mon, 09 Nov 2015 15:15:54 -0600
Message-ID: <87h9ku6fhx.fsf@weregild.amer.corp.natinst.com>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 11/09/2015 03:15:54 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 11/09/2015 03:15:54 PM,
	Serialize complete at 11/09/2015 03:15:54 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-11-09_17:, , signatures=0
Subject: Re: [PATCH] util-linux: create util-linux-runuser package
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
X-List-Received-Date: Mon, 09 Nov 2015 21:15:59 -0000
Content-Type: text/plain

Ioan-Adrian Ratiu <adrian.ratiu@ni.com> writes:

>  RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-losetup util-linux-sulogin"
>  RRECOMMENDS_${PN} = "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-linux-mount util-linux-readprofile util-linux-mkfs "

Should we add util-linux-runuser to either RDEPENDS or RRECOMMENDS?

