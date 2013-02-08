Received: from mail-ob0-f169.google.com ([209.85.214.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U3mr0-0006lg-OD
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 13:14:58 +0100
Received: by mail-ob0-f169.google.com with SMTP id ta14so3848388obb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2013 03:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=BiVHWBDfW+FHzdFVHPJxAso2cahko1vfGIUWLSOoXU8=;
	b=dXq+ieWush07nDnVXxklvYFT5gjRBu9BLrj6UiSV+5eQHpdPTr0lzcxu/EfFo1TfpX
	8UCf+f/9BTd5emM16A61+7wfPwwcRwHNxvOAuGFmpr/OdCs/iV+of1NtPCys2sMmm3EG
	s6kNgcAS7BwYyZrqRP0lqX3+g4JuCTNAzQwEHd+0blUUkjX85kNcWGcfjxuxPmB58XWL
	1DFXZ2Jv7rlSEPkuJnX+tFQVbfBZrmgxBg60W2Xh7gdnb5AwRxfvqK1xQYxYYQBejYJh
	E8C8CKWCm+vgwYKDJXBCfsdXKSg/TFJhmX0cslBVTYC5d9gTrODqBiuyM59iR6quszV2
	ernA==
MIME-Version: 1.0
X-Received: by 10.182.231.39 with SMTP id td7mr3861878obc.86.1360324740248;
	Fri, 08 Feb 2013 03:59:00 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Fri, 8 Feb 2013 03:59:00 -0800 (PST)
In-Reply-To: <CAJTo0LbOcirp-VJT1u9g9Xp8jTREb=UD+dJRftidVpt6tQ3HRg@mail.gmail.com>
References: <1360323133-28592-1-git-send-email-otavio@ossystems.com.br>
	<CAJTo0LaOcn5Kr64Ga7zfuP5q1ixO8Ag4Uy+JrOmDe7AEhDDmpQ@mail.gmail.com>
	<CAP9ODKomOChKyoVD=-O9vNpnRFSyj+N+bz8C=mSLV3rky-hD2Q@mail.gmail.com>
	<CAJTo0LbOcirp-VJT1u9g9Xp8jTREb=UD+dJRftidVpt6tQ3HRg@mail.gmail.com>
Date: Fri, 8 Feb 2013 09:59:00 -0200
X-Google-Sender-Auth: hj53L8pwTW1BGkMJ9i-PopwaJAU
Message-ID: <CAP9ODKrgF1qQFT3u+jedAkTcCbABLJKihhspThy+xGP1EOeRSQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tzdata: We shouldn't override the localtime if it is valid
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
X-List-Received-Date: Fri, 08 Feb 2013 12:14:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Feb 8, 2013 at 9:55 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 8 February 2013 11:38, Otavio Salvador <otavio@ossystems.com.br> wrote:
>>> Can you fix the code to symlink instead of copy?  systemd and more
>>> needs a symlink so that it can identify the name of the timezone from
>>> the link target.
>>
>> You mean inside the if?
>
> I mean in general /etc/localtime should be a symlink and not a copy.

Ok; but I will do it in another patch ... in fact it could be
simplified a lot. I will propose a patch for it.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


