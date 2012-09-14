Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TCSJx-0000Hp-6L
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 11:36:22 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 14 Sep 2012 02:23:45 -0700
Received: by obblz20 with SMTP id lz20so6089568obb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2012 02:23:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=Rxw0VqrmWhhbzC+xs8CRSjygeQKiF7msvVoOtTyU04U=;
	b=jRrLGkxgAtLVfteRzdGQhQmZfaVRL0hLelw74Cq2ABpxDausVxPuKpZKzj9Qg4UH3Y
	qtmOJrCD7ChY+1/+tP6xyhBHxFbOS7Ca4lZAgOQbuJ1tllWgSHdS7PHri4KXnayzNfzo
	JsN9gGPZNb6xEAyA02U4SfO+BWPsUUqGc+IUR0D5JUufqK1JkjiIo4RhbVZsA44qQaN5
	SX0kTNWs5bUIyWcMpy6ciUtE0s5Z5pW1FkwV03hcqup+5u+NE3HJCiWC/6orRkLsWkaX
	5mBqIDoYWhCndCpNes8QmNUojKoh9VVT5LS5VHpnpa6U4lZbBI/T96iaZR5gfCWN8KMM
	Texw==
Received: by 10.60.30.168 with SMTP id t8mr2015644oeh.89.1347614624257; Fri,
	14 Sep 2012 02:23:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Fri, 14 Sep 2012 02:23:23 -0700 (PDT)
In-Reply-To: <5052CE86.6030302@linux.intel.com>
References: <cover.1347534093.git.paul.eggleton@linux.intel.com>
	<6ccf7a1f517e37ce7a8467f4a2432b1ae957e837.1347534093.git.paul.eggleton@linux.intel.com>
	<5052CE86.6030302@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 14 Sep 2012 10:23:23 +0100
Message-ID: <CAJTo0LYHQjL=2vSP=SNcT9csSd8vyGm=d-9_8TRh5SC18h7bCg@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQmco26QXWixHgg/7qsV2L13UBuCbfGRqD0corTM8WeobaorcwQ9ZQE1MWgg2tKkAFD+xELk
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] gst-ffmpeg: add LICENSE_FLAGS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Sep 2012 09:36:22 -0000
Content-Type: text/plain; charset=UTF-8

On 14 September 2012 07:28, Saul Wold <sgw@linux.intel.com> wrote:
> ERROR: Nothing RPROVIDES 'gst-ffmpeg' (but
> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/meta-intel-gpl/build/yocto/meta-intel/common/recipes-multimedia/gstreamer/gst-va-intel.bb
> RDEPENDS on or otherwise requires it)

That's interesting, I wasn't aware gst-va required ffmpeg.  At the
most it should be a recommends as elements are pluggable, and to be
honest I'm pretty sure that's a bad dependency.

Ross


