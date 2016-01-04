Return-Path: <clemens.lang@bmw-carit.de>
X-Greylist: delayed 332 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 04 Jan 2016 08:54:02 UTC
Received: from mail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id EBA2E6FF9F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 08:54:02 +0000 (UTC)
Received: from exchange2010.bmw-carit.intra ([192.168.100.28]:38638
	helo=mail.bmw-carit.de)
	by mail.bmw-carit.de with esmtps (TLSv1:AES256-SHA:256)
	(Exim 4.82_1-5b7a7c0-XX) (envelope-from <Clemens.Lang@bmw-carit.de>)
	id 1aG0oV-00064s-34; Mon, 04 Jan 2016 09:48:27 +0100
Received: from localhost (172.20.20.163) by Exchange2010.bmw-carit.intra
	(192.168.100.28) with Microsoft SMTP Server (TLS) id 14.3.123.3;
	Mon, 4 Jan 2016 09:48:27 +0100
X-CTCH-RefID: str=0001.0A0C0205.568A31DB.031E, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
Date: Mon, 4 Jan 2016 09:48:26 +0100
From: Clemens Lang <clemens.lang@bmw-carit.de>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20160104084826.GA4807@ulm-bmuc496424.bmw-carit.de>
References: <CAJTo0LayEjj9moB9xgup=vB+C9Sn2-WX+s97UWRt9tg=HYFnag@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LayEjj9moB9xgup=vB+C9Sn2-WX+s97UWRt9tg=HYFnag@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Originating-IP: [172.20.20.163]
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Delete all .la files?
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
X-List-Received-Date: Mon, 04 Jan 2016 08:54:03 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,

On Wed, Dec 23, 2015 at 09:41:35PM +0000, Burton, Ross wrote:
> One recipe (opensp-native) needs to opt out of the .la deletion as
> openjade-native for <redacted> reasons explicitly expects .la files to
> be installed.  Some other desktop distros already strip out .la files
> so I wouldn't be surprised if there's a patch floating around to solve
> this.

Note that any software using libltdl will still require the .la files
and must thus opt-out of .la file deletion. ImageMagick is probably the
most common occurrence of this.

To avoid overlinking when keeping the .la files for such recipes, it can
be helpful to clear the dependency_libs field in the .la file.


HTH,
Clemens
-- 
Clemens Lang • Development Specialist
BMW Car IT GmbH • Lise-Meitner-Str. 14 • 89081 Ulm • http://bmw-carit.com
-------------------------------------------------------------------------
BMW Car IT GmbH
Geschäftsführer: Michael Würtenberger und Reinhard Stolle
Sitz und Registergericht: München HRB 134810
-------------------------------------------------------------------------

