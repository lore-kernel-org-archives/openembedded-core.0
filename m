Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vb0-f48.google.com (mail-vb0-f48.google.com
	[209.85.212.48])
	by mail.openembedded.org (Postfix) with ESMTP id B5E566BCA1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2013 11:44:31 +0000 (UTC)
Received: by mail-vb0-f48.google.com with SMTP id w16so121455vbf.21
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2013 04:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=oioeehZFLJzH1Idq5tP/5dNVNuNX/8hYN0mWA50GViU=;
	b=b/8abK7xPxM9XEe42P494APoIqIiEOFU7uLScWLGzrAQEwUDbhyMS3yw+OYJljL3nU
	tjX7NsXYdSwCRH6H5/cTpWoOMikONsSsa6Xnj95PWUfP2ESZ2F1VNSF0MKTaqmuj+ADU
	/iHZICl7eBY7XjNCugrgR9CVlDw3TEYCbJ/OFIHWWAEp/MhJeu9vz8qyZ52iCqK6px/Y
	tjDtgP/u6fkstZdgq7cZRTh8biXcToBbJm5NjuP3uioy6QQzlbp6/3VH24vz8tP4ggP7
	ts3hE5PHa0ZDzqsaeNZ31Sjt0h6JXwksXussdIO+YurBkHDYSVKm76z8VvemNgMpZTjD
	uSrQ==
MIME-Version: 1.0
X-Received: by 10.220.186.202 with SMTP id ct10mr2373989vcb.14.1378295073035; 
	Wed, 04 Sep 2013 04:44:33 -0700 (PDT)
Received: by 10.52.236.129 with HTTP; Wed, 4 Sep 2013 04:44:32 -0700 (PDT)
Date: Wed, 4 Sep 2013 13:44:32 +0200
Message-ID: <CALbNGRROB7mqTpQr=K-HUotmQx2RhCJ-Cnf=BsmSj_W6svWj6Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: do_patch and binary patches
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
X-List-Received-Date: Wed, 04 Sep 2013 11:44:33 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

did not find any helpful hint - and cannot remember somebody asked
already: Is there a specific reason why our do_patch ignores binary
files - or is there a way to allow binary files in patches?

Andreas

