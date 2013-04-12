Received: from mail-vc0-f174.google.com ([209.85.220.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UQaP9-0005mN-0E
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Apr 2013 11:36:23 +0200
Received: by mail-vc0-f174.google.com with SMTP id kw10so2007031vcb.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2013 02:18:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=cp3cGvqwkUwAvE6Ugwmr3++v2pZczKv7iExL+UTRqhY=;
	b=GxYPcTPWRb2D5e6fb00gIXTVMlpJ22ZQAO8pddnN8dY5pFsHVBS/0HZ77iFvLwcfct
	lZv7zgT3tdLcCfKcy7vqFzGs0E3XRTTFKnVOjD5DUJGHiss0lkyrLqSRzB1vB8/WmpEo
	su7ratbAb3Lad6V/wScY4T9x5Vc2TYJLWLVZatrJDnnOCww0xO9w/AXi32bBrULH2qNw
	r0Q5yBksIaIRp6pzUpDS9Qx8luauyE3feYFzNecYYfC3AQojHUrgpcTVr23iRHOHxTgW
	v9HpzfD7u9rAg/p1ud0bpKW6n5CQIukRZZeUlnCkLVimcFyraWKN/TahBdzxKD329dZK
	vVjQ==
X-Received: by 10.52.108.10 with SMTP id hg10mr6565751vdb.34.1365758338515;
	Fri, 12 Apr 2013 02:18:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Fri, 12 Apr 2013 02:18:38 -0700 (PDT)
In-Reply-To: <51675A40.6080600@intel.com>
References: <51675A40.6080600@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 12 Apr 2013 10:18:38 +0100
Message-ID: <CAJTo0Lb0GK3+TBpsytc=-atsz6DYo3Obw_Ezz4c9qpUHcwpdcg@mail.gmail.com>
To: Saul Wold <saul.wold@intel.com>
X-Gm-Message-State: ALoCoQmvcUud0IfMT8S3KNvpcNdFBpZlB8KF8rtlkEDrFtaHXpjzCanApNI05bZCGwGakZY8B165
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Master under test with gcc-4.8
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
X-List-Received-Date: Fri, 12 Apr 2013 09:36:29 -0000
Content-Type: text/plain; charset=UTF-8

On 12 April 2013 01:50, Saul Wold <saul.wold@intel.com> wrote:
> I have seen a couple of failures with an initial build in xmodmap and
> matchbox-panel (when building a sato image for x86).

xmodmap is probably fixed by integrating this commit upstream:

http://cgit.freedesktop.org/xorg/app/xmodmap/commit/?id=42f99a7a7b836f6f9704a7b1747eb722c93446ec

Ross


