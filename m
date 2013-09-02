Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f41.google.com (mail-vb0-f41.google.com
	[209.85.212.41])
	by mail.openembedded.org (Postfix) with ESMTP id C2CC26BBD8
	for <Openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2013 10:48:13 +0000 (UTC)
Received: by mail-vb0-f41.google.com with SMTP id g17so2910141vbg.14
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 02 Sep 2013 03:48:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=8okGHtf0nhtV0KjvrewLMuYaGFVgB5OlFqGefmgJ00I=;
	b=eFYkbDmo9gkdfUfTXp2y8dKzGawKPezBV6f+8A2K7u63C2DcfGTzmjWrat9bhhqNcd
	rkv+UYGjgtN+gGXtoc9h7SKrbPQsw2hIBLDv6HGeHDycFfdQ/NZbLhQQqTVHHOtfyxAc
	1s9Oe2lWH9tCPRJDyqAqizFvYVnuOOvovM9zs+Dqdxl121tyQGj/zqVX/yyEMSxtTy0Z
	2urAQbPwIlMCXXReHlg11lsXoYUHmWk658wXywLpQ70QkQlwlYx29eMRkcx4uL4ovvHb
	PuUZFng0PX9Y4dnsORMLhB4PJjTY1gxWPQaVlOarOmkrX5+ejmiH6CUKh9qxUxCAFMTK
	d1yA==
X-Gm-Message-State: ALoCoQly4Wm+cEFZXSVxU/Afeurn17P2v8TITI7t0Uo2c2m3ARufFbr9wGa+CgqDtSucpTsLY0wY
X-Received: by 10.58.119.233 with SMTP id kx9mr22313322veb.3.1378118893924;
	Mon, 02 Sep 2013 03:48:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 2 Sep 2013 03:47:53 -0700 (PDT)
In-Reply-To: <5217BD3C.6040402@linux.intel.com>
References: <739A9EF8-4ABD-419C-978B-29006E185238@gmail.com>
	<52168CC1.5050906@linux.intel.com> <20130822225302.GN522@jama>
	<97E14A4F-C674-4D5A-946F-F09F41F35AB3@gmail.com>
	<5217BD3C.6040402@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 2 Sep 2013 11:47:53 +0100
Message-ID: <CAJTo0LZTVWqV59LtLB1PONMzPwuBmC4Nd+0Hbkm3YA57JcwEsQ@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: "openembedded-core@lists.openembedded.org oe-core layer"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: World build on OE-Core
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
X-List-Received-Date: Mon, 02 Sep 2013 10:48:14 -0000
Content-Type: text/plain; charset=UTF-8

On 23 August 2013 20:51, Saul Wold <sgw@linux.intel.com> wrote:
>> Ran fresh from scratch builds and it seems its better, I have posted the
>> results at
>> http://sakrah.homelinux.org/files/world/
>>
>> It seems x86/x86_64 is same failure that Martin mentioned
>>
> Is there a bug filed?  If not can you please file a bug and include the
> compile logs and your local.conf/distro settings.

I just filed https://bugzilla.yoctoproject.org/show_bug.cgi?id=5096.

Ross

