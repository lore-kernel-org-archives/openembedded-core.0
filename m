Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UeSbm-0001xY-9O
	for openembedded-core@lists.openembedded.org;
	Mon, 20 May 2013 18:06:52 +0200
Received: by mail-ie0-f175.google.com with SMTP id s9so13688799iec.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2013 08:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=VbqI8Bi4vK7rQhzOgZ3mLM1vNzUWjUncW/eLjvc1raU=;
	b=wr036z6KGiDT7AnVUjt4PousZbMqKq6rWu5rtiBp334fxlYFCfFIYeFHHHUs9yjYV8
	OKVbJ4zK6a9fa5bliNCacQJITZbQBimVC4nX4gYoXn/GxShX2VQICz7yXzNe24ItDlMX
	H+eIN/M9cljHX9Gl43xCz7i1wOR+sWAMHuBWS7pZQPCvUfaapxfviCMnQOJsIN5VGd8B
	A6M/13ahBOAs0MOktUgjntZOmGFEcUWdGUEVrs1cfDRmzUVOyoWnwe/YrroRglV46hlN
	CChJuFPFOQvSWSgqhmZLgDSq7QqrLKGWUeNAHhOHDgrvjCp2RPpOeEzXr5YVPtvudfJB
	5kwg==
X-Received: by 10.50.85.12 with SMTP id d12mr5557705igz.91.1369064905551; Mon,
	20 May 2013 08:48:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.109.133 with HTTP; Mon, 20 May 2013 08:47:55 -0700 (PDT)
In-Reply-To: <1369064142.2210.7.camel@firebird.rb.intel.com>
References: <1369044584-6053-1-git-send-email-laurentiu.palcu@intel.com>
	<1369064142.2210.7.camel@firebird.rb.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 May 2013 08:47:55 -0700
Message-ID: <CAMKF1sq2DSp4tM4TrE_3Ys4ao112kQvyhUNwVhqRFD2r77_frg@mail.gmail.com>
To: "Stanacar, StefanX" <stefanx.stanacar@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runqemu: fix networking issues
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
X-List-Received-Date: Mon, 20 May 2013 16:07:05 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 20, 2013 at 8:35 AM, Stanacar, StefanX
<stefanx.stanacar@intel.com> wrote:
> Also I think ROUTE too should be changed to use ip instead of the
> old route command.


yes it should be.


