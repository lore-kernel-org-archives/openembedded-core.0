Received: from mail-ve0-f170.google.com ([209.85.128.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UCZGM-00044o-UX
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Mar 2013 18:33:25 +0100
Received: by mail-ve0-f170.google.com with SMTP id 14so4938178vea.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2013 09:16:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=YhvV/nEPoFbPLFtKz6QL27E7RB0pgi3TVWnaQtz/hzc=;
	b=UD9//UEeJa7C0W4Q5OzT/C/f94fmojK11qYo5tdf0H39SGUlhTGAsB2OjbCZ/U0zk8
	RG57C6s8/VshpPO99I/4IVyOgzrJWBFyLK+2XfsnIzpckwSPnHyYh7Na8lbxDKjl3NFu
	PybkOlNUiPBGOjcpt/U3AP0uSTvsc6B8ApTs7pK59PBbzosKtQ0BSSFby5D2z3cGuq1i
	HGyWrh5VWeyXD3XAM5KDarifNsv3f3LYSZFWGqUtSG/lADPCFIo7RkqCQA47Sa6wbgBx
	eUAQTvZ5G2yckneeBBu4MzBfLiWHqgJMCRh7/Qua5jsIeaWO7UMHLFjrK07tdPz0Tc56
	cX6w==
X-Received: by 10.220.156.75 with SMTP id v11mr8009971vcw.1.1362417414533;
	Mon, 04 Mar 2013 09:16:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.219.195 with HTTP; Mon, 4 Mar 2013 09:16:34 -0800 (PST)
In-Reply-To: <CAP9ODKozO-vpHdqDWxPMnYaaCt6eZUy_EjoEfAeDObdSjKj2_g@mail.gmail.com>
References: <1362407704.29587.39.camel@ted>
	<CAP9ODKozO-vpHdqDWxPMnYaaCt6eZUy_EjoEfAeDObdSjKj2_g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 4 Mar 2013 17:16:34 +0000
Message-ID: <CAJTo0LZqk7pB4PJhumn827PNQ5-vqr8mve9Kc1Kr4ra-K+3iVA@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Gm-Message-State: ALoCoQlvfIZElWVeIc3aSrRSoPY6Pk/t7FZUSnqdlEVWMuk/Hd38opYAb2b1qJmSdMJfXzjoH6e6
Cc: yocto <yocto@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Feature Completion Deadline for 1.4 looming
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
X-List-Received-Date: Mon, 04 Mar 2013 17:33:26 -0000
Content-Type: text/plain; charset=UTF-8

On 4 March 2013 17:00, Otavio Salvador <otavio@ossystems.com.br> wrote:
> The systemd integration? Will it be  reworked so we have an upgrade path?

As discussed on yocto@ over the weekend I'm currently working on a
branch that supports simultaneous sysvinit and systemd support.  I
hoped to have it for review by now, but we had a family illness last
week so I wasn't working fulltime.

I'm still holding the view that init scripts belong in the daemon
package, with weaked dependencies and checks on postinst, as the
logical conclusion of PN-systemd packages is to also create PN-sysv
packages, and that's a serious upgrade path concern.

Ross


