Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SwtVy-0005YS-Jo
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 13:24:26 +0200
Received: from mail-gg0-f180.google.com ([209.85.161.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 02 Aug 2012 04:12:45 -0700
Received: by ggnf1 with SMTP id f1so7559058ggn.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 04:12:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=O0G6TQs8EVRUr0pXd0xhm4gLgTFQYFUvTV4VM1rueoM=;
	b=a7MurzkuuKfUBvDBuiOR7/1Tw6GDX48MAnPGe/Jx/mVqLUBIbFA8wPQpXwhq3d4gGY
	p8YaSnmZa4FEsrYkrOzd+txvbTKfVAjTBnp7OEKAfWx6qr8LuTianCZ7psZM46skaTwb
	iKVBB6AvR3u8vvaEIUtx7ZgboAsHpA/uxzobV02L+ZbWqPAhCCBkveblfp1/nEMddze2
	EmNYQ8ScAaFSEi+mOy5WvFT6i0sHf3WoPv51tg/KL1kMOTyQ3ojogL7VRKHUOoV2BK03
	VfAXQPjEjinWGo05B9TpLq5ZelUq4L0WZn+b4Ar3TbNUBQgNs8dfE0sUMizjts0y3Ui9
	oNMQ==
Received: by 10.50.195.195 with SMTP id ig3mr2855749igc.61.1343905964695; Thu,
	02 Aug 2012 04:12:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.70.229 with HTTP; Thu, 2 Aug 2012 04:12:24 -0700 (PDT)
In-Reply-To: <40727268.akUMmXJU4Z@helios>
References: <cover.1343899228.git.paul.eggleton@linux.intel.com>
	<db2dd38ac0b16d55f729f63010e38dda4dcfced5.1343899228.git.paul.eggleton@linux.intel.com>
	<CAJTo0LZ7QJtfzmsg2a++ay8YoNOptRFohWwQrKNT0JrHYkYRbw@mail.gmail.com>
	<40727268.akUMmXJU4Z@helios>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 2 Aug 2012 12:12:24 +0100
Message-ID: <CAJTo0LY2+vW+Px2kh26RZXyorqOAqM1OBzCG3aAJQJ+rWeGU8Q@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQk9XC+ujkpz/3YLX6oX6XMY47L28tNdwbKVDLKbSL6jqLy+pf7Oe8LJhIX4YjXr/ZV8vq9r
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/9] scripts: add buildhistory-tag script
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
X-List-Received-Date: Thu, 02 Aug 2012 11:24:26 -0000
Content-Type: text/plain; charset=UTF-8

On 2 August 2012 11:49, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> Interesting - sounds like it would be useful, but I wonder how it would then
> fit in with buildhistory-diff as a separate script (particularly with diff as a
> valid option to "buildhistory")...

Rename it to -compare?

Ross


