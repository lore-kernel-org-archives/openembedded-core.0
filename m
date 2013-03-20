Received: from mail-ve0-f180.google.com ([209.85.128.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UIN3r-00011m-5F
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 18:44:34 +0100
Received: by mail-ve0-f180.google.com with SMTP id jz10so744259veb.39
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2013 10:27:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=5Hjv++C87VcH4UtxzTtTHKrtBV7xxuQgS8kEQziPgLY=;
	b=lX915KD16PF7uNeOK6ngTWyxBiqqynac+K80clfQa01lvVMsf5PKALZtwWmXDVuZJ6
	GAdSRmpPutkkl6ecmvfiEGOOTaA0mYEmUuRd7JxylY/OdQ4nM5X8HAXap8SWTi3R4V4J
	0pXxnCgmUNip5zwFTZRoAuttbgFPOiiWiLTJnHdqgfDCNDcDEEnZwZgAWSmhS3JyTiRe
	emuBCYubVZcUHuRkj3XAsNs/WdZQFW13snLnWKHpp9I8DDMMhTEKyOXIicGsYqy+ws/n
	kZ8XjCFpFlI1rExIZ+FOSq2HrhaC42dT35Y/hxsDjGJGE5rm2qg9DDOl1qibmwpUgKeB
	0xYQ==
X-Received: by 10.220.141.132 with SMTP id m4mr8975867vcu.17.1363800455557;
	Wed, 20 Mar 2013 10:27:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.125.102 with HTTP; Wed, 20 Mar 2013 10:27:15 -0700 (PDT)
In-Reply-To: <face120c816e78dffad876f43218920c1a7da423.1363673104.git.Qi.Chen@windriver.com>
References: <cover.1363673104.git.Qi.Chen@windriver.com>
	<face120c816e78dffad876f43218920c1a7da423.1363673104.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 20 Mar 2013 17:27:15 +0000
Message-ID: <CAJTo0Lb8PcUr6MPp7EZcXKtwfYQR-MXc90FhfKedGuaL8LvWOg@mail.gmail.com>
To: Qi.Chen@windriver.com
X-Gm-Message-State: ALoCoQlpDlPTCknJ+d+jwqMAM73MIIe75t59Yg+Ev6nAqMmWOXdhxtg1x/t/uaRfm9/PtjVZ2ORa
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] util-linux: better co-operate with systemd
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
X-List-Received-Date: Wed, 20 Mar 2013 17:44:35 -0000
Content-Type: text/plain; charset=UTF-8

On 19 March 2013 06:51,  <Qi.Chen@windriver.com> wrote:
> util-linux upstream is now supporting systemd.
>
> So in case of a systemd based image, we add to EXTRA_OECONF
> '--with-systemdsystemunitdir' to specify the location of systemd unit
> files, and '--enable-socket-activation' to build uuidd with socket
> activation.
>
> Also, package systemd unit files into util-linux if systemd is in
> DISTRO_FEATURES.

I've merged a version of this to my systemd branch.

Ross


