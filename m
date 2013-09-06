Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 40B5C6BDFB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 23:53:38 +0000 (UTC)
Received: by mail-ob0-f181.google.com with SMTP id dn14so4058537obc.26
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2013 16:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=kGw+SUUBuRhLPXE63c57cHSzGrg/V12NnNvBCV8+szY=;
	b=NmVbB6DG9BF3uvBSkh3DK9Tfk82Z2KS9IHjEuZ4ngGtJXq9RxqnrkutpMS+xqOB+a1
	oksLxSXfkoMVEhb08WLYyYwod6MphOFCbjmSdnrz6qpxDUnY1q6vxOvNHo0AvB6Iar5Z
	S06QsFbBp9tQKPl8awgZVcCh3706QrED/tfrWiXk2aCgcD7s3KHHTujxgJ3klCHO2NIp
	NSViOaPlSx66aB9/9eJ4Ymx53YrZDM4XVtnonBfSynDZ3u6vsynRjeeKei5m/Rmg0z55
	QmaSDIKfvNyUQ22OVOWkhzta1WeB9/6tm586L+kc2ppE6YwOjSLae97yfgQ+GP6TkiHu
	C06A==
MIME-Version: 1.0
X-Received: by 10.182.199.74 with SMTP id ji10mr3735065obc.69.1378511620099;
	Fri, 06 Sep 2013 16:53:40 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Fri, 6 Sep 2013 16:53:40 -0700 (PDT)
In-Reply-To: <1378502118-18126-1-git-send-email-raj.khem@gmail.com>
References: <1378502118-18126-1-git-send-email-raj.khem@gmail.com>
Date: Fri, 6 Sep 2013 20:53:40 -0300
X-Google-Sender-Auth: sPAC_eJtvuphrY5HQyVyxfG1uO0
Message-ID: <CAP9ODKo+N4yRjbTc=EgmBFMBwg5NzBxQ0T7_jRwP_45coQ2ZQQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] package.bbclass: skip already-stripped QA test if asked for
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
X-List-Received-Date: Fri, 06 Sep 2013 23:53:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Sep 6, 2013 at 6:15 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Some packages like grub have already stripped binaries e.g.
>
> ERROR: QA Issue: File '/boot/grub/kernel.img' from grub was already
> stripped, this will prevent future debugging!
> ERROR: QA run found fatal errors. Please consider fixing them.
>
> We would like to have a possibility to skip it using something like
>
> INSANE_SKIP_${PN} = "already-stripped"
>
> This adds the logic to do so
>
> it acts at PN level and not at package level. so something like
>
> INSANE_SKIP_${PN}-misc = "already-stripped" wont work.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

