Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SxHyW-0007U5-O6
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Aug 2012 15:31:32 +0200
Received: from mail-wi0-f178.google.com ([209.85.212.178])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 03 Aug 2012 06:19:50 -0700
Received: by wibhr14 with SMTP id hr14so464657wib.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Aug 2012 06:19:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=date:from:to:message-id:in-reply-to:references:subject:x-mailer
	:mime-version:content-type:content-transfer-encoding
	:content-disposition:x-gm-message-state;
	bh=nMCfwYiL/D/1Gwzx+EEcaAk1C2gK2oAGiV3ZeolurU0=;
	b=Z70IqoVau6MOAUcS3kBMrqUzEDTI2vnCA2eMG8eg+UOpb5HLNTdeSuhaDLF1k7NjhD
	H/EmbDIl+A/2SqmQYh2IGLsfwevUWu5jIQIRwmULpkxrW0OKJFnSjBN22riGf51n6Ps7
	DQ6/BxePP4ke8qLjMjQY8viBrSvAoR3ltFTPsId/e76KGJBaYjpXT2ZhG+t+G7DNwcjy
	4tE6NwjaJlLUmQCUcRZXCHqSsIE+HlIxqAJq3RL5Cxi/Z3BkXhWAuJ5ktj4jvq8mkEsX
	AfJmM8eSR229sSeQkijLFNaAFYzf7dyz4ssFXerfAKmQFLCu7KMcb5Kp4HUYIxEQQ0ut
	N6aw==
Received: by 10.180.81.165 with SMTP id b5mr13329914wiy.17.1343999988739;
	Fri, 03 Aug 2012 06:19:48 -0700 (PDT)
Received: from [192.168.1.12] (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id k20sm39548006wiv.11.2012.08.03.06.19.47
	(version=SSLv3 cipher=OTHER); Fri, 03 Aug 2012 06:19:47 -0700 (PDT)
Date: Fri, 3 Aug 2012 14:19:45 +0100
From: Ross Burton <ross.burton@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <EC2F754A1E854583B06C4E1BF18AB5F9@intel.com>
In-Reply-To: <C94E9933-5642-406C-ACBC-2F0A13E6AB41@dominion.thruhere.net>
References: <cover.1343926021.git.ross.burton@intel.com>
	<94E6EEF2-BA2A-4B68-A9CB-98133061274E@dominion.thruhere.net>
	<8242048D6F2A4934B1D6E6CB30CF8C3A@intel.com>
	<C94E9933-5642-406C-ACBC-2F0A13E6AB41@dominion.thruhere.net>
X-Mailer: sparrow 1.6.2 (build 1143.6)
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQn//V3A3S04KzwLXsUiSptKBU0xu7Ha1RK/7GV8+SiZCiQfPlaMKV7XOi0erzMNxma06Y+a
Subject: Re: [PATCH V3 00/11] Mesa upgrade/improvements
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
X-List-Received-Date: Fri, 03 Aug 2012 13:31:32 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday, 3 August 2012 at 11:18, Koen Kooi wrote:
> libegl and libgles aren't built nowadays, so the problem is avoided. Noone has dared to touch this subject the past 2.5 years: http://cgit.openembedded.org/openembedded/commit/recipes/mesa?id=3d96f8cb61225d515b5cb4fe863f0d50c3ced436
> 
> The best solution[1] is to disable egl/gles in the mesa-recipes and add a seperate recipe for them. That way you still get glu and other useful mesa bits needed for gnome/efl/xfce/etc, but you can skip the sysroot/shlib poisoning if needed.
After much digging I see that the Beagle PVR drivers only provide gles and egl, which is why you say that the problem was avoided.  Of course that's just one specific driver, for example the Cedar Trail EMGD driver does build libgl, libgles and libegl.

If the solution is "put the egl/gles bits in another package" then I'm totally confused as to what the actual problem is.  Considering there's numerous libegl libraries for the many variants of PVR on ARM, I'm struggling to understand exactly what is new here.

Can you explain clearly what the problem is, I'm obviously missing something.  Once I understand the problem I can help with a solution.
> [1] The best solution if of course getting sgx support into mesa, but nothing is happening on that front apart from some posturing on the fsf side, no actual code.

HahahHAHAHAHahha.  (wipes tears from eyes)  The FSF can posture all they want (wasn't aware they'd done that as the code is clearly closed source), but I can't see Imagination opening all their code any day soon.

Cheers,
Ross 



