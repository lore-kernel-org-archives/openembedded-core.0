Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SvtkB-0003Fx-Vl
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jul 2012 19:27:00 +0200
Received: from mail-qa0-f45.google.com ([209.85.216.45])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 30 Jul 2012 10:15:22 -0700
Received: by qaeb19 with SMTP id b19so982965qae.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2012 10:15:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type
	:x-gm-message-state;
	bh=GTOvbE6M82Izsge4g/+qTBgHF/hXijzdFMMeEN2won8=;
	b=lhXewbuWgBPzqeBx+lbVrwiEYLBDDH+OLzo3U9b1li4JnqbQS26LRVBWCwZ3I5YelA
	+a/yKoQ8pK+37KO9sKNuAD1gRzxaXIYFOHm/aa9QsI0lo94L4BHL4xLtQ2oBTCue5RXK
	cHCxthrZcdjEERmlIeFxI9futXDsieBxtO88WP0KUJsms+PDy0EBZLR55RBJ+iy09FFn
	QpRgnBU083OrPZKjPJHM9l6/1z1tbK29sZvXBkyaR8VqUgt4sprw+5RqFYIX3udh/7VX
	4c9vKhqDpOpxPRduvTcDeexehXpcqce0J1kMcui+yJ3SwYl0IdvQIG1E4v2f+1kbxkKb
	T0Mg==
Received: by 10.60.2.99 with SMTP id 3mr18535502oet.20.1343668521368; Mon, 30
	Jul 2012 10:15:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.43.99 with HTTP; Mon, 30 Jul 2012 10:15:01 -0700 (PDT)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 30 Jul 2012 18:15:01 +0100
Message-ID: <CAJTo0La9DXgEH-Yr-31=iCnegQhgHGxTdpnizEpG=OEHNk_veg@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmzynJ3KsgjS97ABnSW9ooy6tvM5L1/RQ5vRbGkrnxy/BySHdRNpb4pkVIlDxaJhZ6Eeqdm
Subject: mesa-dri vs mesa-xlib
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
X-List-Received-Date: Mon, 30 Jul 2012 17:27:00 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I've recently been looking at the Mesa packaging (via the work that
Damien Lespiau has been doing) and am confused as to why there are
both mesa-dri and mesa-xlib packages.  I'm also no Mesa expert, so I
thougth I should mail this list...

The main difference appear to be that mesa-dri uses DRI to render,
whilst mesa-xlib doesn't (so it uses indirect rendering).  As DRI
support is hardware specific so surely this could and should be turned
into a FEATURE of some sort, and then let mesa pick appropriately
between DRI or indirect (xlib) rendering.  I can't think of a
situation where you'd want to use indirect rendering when you have DRI
available.

Can anyone see any problems with merging the recipes into a single
"mesa" recipe, and making DRI support conditional on a feature?

Ross


