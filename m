Return-Path: <net147@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id B67C273689
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Mar 2015 00:30:47 +0000 (UTC)
Received: by pagj7 with SMTP id j7so45571474pag.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 17:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=HJaNNb0Gv8/bP42zOH0sahK85QBuuEJaT/7B/XoovWw=;
	b=lt5SWiVgB2edsPiNsBg3fiJfzqIhFL7Un8h2ccMVbdMlvyDk4zWsFkCUidX1pguCrn
	hkj9JoFSdXVSJlYTaS+fx8CNz0mNqrQ4Ex75p6PSelMPZVEW+Ev9m5dDgv/G6ZXNjOy2
	dd+YJPcbyJ1OmdS1sw+/5oN5zCEw4n+FEddnuaytGkstj1zXnOzx0m1/HXwjRMuvYjCI
	/ca54EJlmX0rqVXamSlqJv5cyCOctVngSBTSikW7Fmob60Cq2eZIxV+RLk+7MAn6z2Uu
	nxIvBNfJwV10KCRpQC7+DeRqWk8B3SZWo/z0IkkrcM77kbKGx/PqvK0VT92PsSBgOLuC
	tgEQ==
X-Received: by 10.68.166.65 with SMTP id ze1mr21455544pbb.142.1427329848635;
	Wed, 25 Mar 2015 17:30:48 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	kl10sm3602797pbd.15.2015.03.25.17.30.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Mar 2015 17:30:47 -0700 (PDT)
Message-ID: <55135332.1050603@gmail.com>
Date: Thu, 26 Mar 2015 11:30:42 +1100
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org, 
	Armin Kuster <akuster808@gmail.com>
References: <1426152011-20488-1-git-send-email-net147@gmail.com>
In-Reply-To: <1426152011-20488-1-git-send-email-net147@gmail.com>
Subject: Re: [dizzy][PATCH v2] systemd: fix /var/log/journal ownership
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
X-List-Received-Date: Thu, 26 Mar 2015 00:30:47 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 12/03/2015 8:20 PM, Jonathan Liu wrote:
> The ownership needs to be explicitly set otherwise it inherits the user
> and group id of the build user.
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>   meta/recipes-core/systemd/systemd_216.bb | 2 ++
>   1 file changed, 2 insertions(+)
Ping.

This is a backport from master:
http://git.openembedded.org/openembedded-core/commit/meta/recipes-core/systemd?id=0752c79282b1cc9699743e719518e6c341d50a3a

Regards,
Jonathan

