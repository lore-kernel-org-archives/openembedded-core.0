Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 4DE5573FE4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 15:07:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 59DF2601507
Message-ID: <1431356851.3086.12.camel@collabora.co.uk>
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: Bryan Evenson <bevenson@melinkcorp.com>
Date: Mon, 11 May 2015 16:07:31 +0100
In-Reply-To: <BN3PR0501MB1090244F8445D0795045EC21BBDB0@BN3PR0501MB1090.namprd05.prod.outlook.com>
References: <cover.1431326066.git.joshua.lock@collabora.co.uk>
	<BN3PR0501MB1090244F8445D0795045EC21BBDB0@BN3PR0501MB1090.namprd05.prod.outlook.com>
X-Mailer: Evolution 3.16.1 (3.16.1-1.fc22) 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/70] Proposed changes for fido
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
X-List-Received-Date: Mon, 11 May 2015 15:07:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Bryan,

On Mon, 2015-05-11 at 12:40 +0000, Bryan Evenson wrote:
> > Bryan Evenson (1):
> >   util-linux: Add lastb to alternatives
> 
> There is a refined version of this patch available that was 
> submitted to the mailing list here: 
> http://lists.openembedded.org/pipermail/openembedded-core/2015
> -April/104132.html.  It uses PACKAGECONFIG to remove last, lastb and 
> the man pages for last and lastb from the util-linux build if 'last' 
> is not in PACKAGECONFIG.  It also adds 'last' to PACKAGECONFIG by 
> default which mimics previous behavior.  I'm still a little unclear 
> on the patch approval process, so I assume the updated patch would 
> need to be accepted into master before being backported into fido?

Unless the patch is specific to the stable branch we only pull in
changes into a stable branch once they have been reviewed and accepted
into the master branch.

Is this change valuable without the refined patch? Or should I pull it
until I can merge both?

Thanks,

Joshua

