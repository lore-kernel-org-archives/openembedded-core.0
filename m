Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f180.google.com (mail-vc0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 853CA60592
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 10:54:54 +0000 (UTC)
Received: by mail-vc0-f180.google.com with SMTP id gf11so6508573vcb.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 03:54:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=pgBOoanpTKzu1QxQLDMcWont7BSfzxFQHi2DOsJjr6g=;
	b=F2vAoj1NxwyuCjYhDOOIRJp1Kw+JECGB+ROSydfA9T94dLGom3IbWGrrw5bs46DZ6p
	GbYlEseeVvhqLQPjDlxgbTY5OMDmrF9Ybl5t02zGh59az3wHeLiek4AKlK6z/GO2BhLc
	5Sp2w2PedIqVjopoCkKTw05F03rLIa40MFWQaPTpD0MidwBiKoes8yVBfEmvZ6vqFOfx
	+US1hbnF3ZkidU2A43OgfxSi+M1g41hINo0S4UXQ3qbnzzSd6O76lUj1oC7cgh804gXW
	m/y9XkA62v/bL/Uc1iBtcn8lJC/3FMBXV/FeKyWRiqn9TvDHDIWDJ9bzCYq3TrtDkVMJ
	mqJQ==
X-Received: by 10.220.192.4 with SMTP id do4mr21386649vcb.91.1373540095093;
	Thu, 11 Jul 2013 03:54:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Thu, 11 Jul 2013 03:54:35 -0700 (PDT)
In-Reply-To: <51DCCD6D.5050807@cn.fujitsu.com>
References: <51DBC97F.1090606@cn.fujitsu.com> <51DCCD6D.5050807@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Jul 2013 11:54:35 +0100
Message-ID: <CAJTo0LYQ4MJ3CUDZaVfDexcaO=MATWj0syDTpY5Veb3m1TNiMQ@mail.gmail.com>
To: Bian Naimeng <biannm@cn.fujitsu.com>
X-Gm-Message-State: ALoCoQm/sVABHAbXPNTa+lz4PwGQyPQDhHXszIZJCHi/rjsCcfHt6hqQJ03c2lz+D52Aii3uiKiG
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1]package_rpm.bbclass: remove xx.spec before doing rpmbuild xx.src.rpm
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
X-List-Received-Date: Thu, 11 Jul 2013 10:54:54 -0000
Content-Type: text/plain; charset=UTF-8

On 10 July 2013 03:56, Bian Naimeng <biannm@cn.fujitsu.com> wrote:
> Sorry, it looks like i should post this patch to poky. please ignore this

You were right the first time, meta/ is oe-core. :)

Ross

