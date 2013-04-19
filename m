Received: from mail-vc0-f179.google.com ([209.85.220.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UTBGD-0001rw-UH
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Apr 2013 15:22:00 +0200
Received: by mail-vc0-f179.google.com with SMTP id hz11so3844382vcb.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Apr 2013 06:04:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=IjhMoUzuTquyfTD+nd9nU37lpf4Fx5IX7Sq01BRis/E=;
	b=a0+i5+R3IOYDlek58M2iX06wUA8R4jr4jHpRZC3JrH3I1qTnqJgljQTu4nWZo12Mdg
	cKvv8SSvYOhihv2E7VVi7tGfgIGcl/j8+M/1sgHRfMn+iT0qutJTLeL1nGi3KXqZwlik
	cn5aeGfZPV+MO15WKWwDy+EwIsyqf81y7U8oos9MJQ6x15MUyu86wSIgXhzE/qB4c62L
	sCTFigoji6OLrEK7IlzlR+TshxVkK456wLlrVOlMLcELGDxmlkrWKh4ObAmHXJay8gUB
	gMtcMAqkcRGTRjOuFgudykcrk+F3CT9vhxgx+lgxW09N7EHFItRR9/EY3m/+FIO5Kdav
	2Z4w==
X-Received: by 10.52.28.139 with SMTP id b11mr9735029vdh.4.1366376658985; Fri,
	19 Apr 2013 06:04:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Fri, 19 Apr 2013 06:03:58 -0700 (PDT)
In-Reply-To: <5437CC85-9AC1-4A18-BAE8-BDE01613215D@dominion.thruhere.net>
References: <CALbNGRRDhXutLhQMs+prxLG3wbs3Y4pZbwR-D=VNR4Z=OUycMg@mail.gmail.com>
	<18219582.KT7bte5u1O@helios>
	<CALbNGRQpB3dqZBzsftXeYz_P7GW8h_Lq6C6SD-Qj79qHzea0tw@mail.gmail.com>
	<3344072.3yQMCnL6TJ@helios>
	<B9C5C522-FF02-4724-B527-ACBE69FDE1B8@dominion.thruhere.net>
	<CAJTo0LZ54q91K8GNEP0RB7St4L+mpm861-kpaXTGswsqLSUk1A@mail.gmail.com>
	<6BD1F316-C3AE-41BD-B9ED-296278CEF5A7@dominion.thruhere.net>
	<CAJTo0LYeJwW-Lbf9bEZogCh1e97bwj7PTgFZV=3NbwN=PMWENg@mail.gmail.com>
	<CAJTo0LYRPtG_N1WCE37UTvGvy5HYt7ia1ym12iR874Ykb8QwTg@mail.gmail.com>
	<623CB95B-FD17-49A5-9547-71E0EFC316A7@dominion.thruhere.net>
	<5171293A.5010300@intel.com>
	<0E83C36A-8358-40B0-B022-A39DBFF44880@dominion.thruhere.net>
	<51713804.9000002@intel.com>
	<5437CC85-9AC1-4A18-BAE8-BDE01613215D@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 19 Apr 2013 14:03:58 +0100
Message-ID: <CAJTo0LbkfHKtEGnMDso0L5L0C62rO+ox__NHRu63HOt7Toh5wA@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlA1+7FbL5MQTNhbZ1PGDzhAlg9bznFqiXGmtxwZ/fwxVMIA5dPJl0ShYPfTteS9so3OV/P
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: postinst does not finish
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
X-List-Received-Date: Fri, 19 Apr 2013 13:22:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 19 April 2013 13:49, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> Running the postinstalls at first boot appear to hang because (and
>> that's just a feeling) gtk-icon-cache is run twice on target... which is
>> time consuming.
>
> I know it's time consuming, but it finished on 60-90 minutes with 1.3, I =
left it overnight and it still hadn't finished. I have the LEDS configured =
to short mmc0 and cpu0 activity and there' s no IO, only cpu from time to t=
ime. I don't think it takes more than 14 hours to run those postinsts.

How about hacking the postinsts to use sh -x, so you can see what it's
executing?

Ross


