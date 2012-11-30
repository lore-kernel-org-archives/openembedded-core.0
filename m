Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TeZV1-000213-NP
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 23:56:00 +0100
Received: from mail-da0-f69.google.com ([209.85.210.69])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 30 Nov 2012 14:41:39 -0800
Received: by mail-da0-f69.google.com with SMTP id x4so820333daj.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2012 14:41:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=nYi+yt116rRXDKH8maLkB0qCWe+jGxt5Rf9TMpy7xy0=;
	b=V0WCggEYHuCMczVWr0g182cdXPDZS0IbiLoOm7e4kRzvzcDy/e3sTtk1sZKFpsjHdw
	pykp3/9eic+rkq2RbiAKrwPtC2fyAzbt7bIcD0gJlZdAM278RjnULGmvZQs6QDlG/yIB
	ZSxP0FzRwthgFthtf3zjE+cZdVnEhI1uUHZrXh+V0YSxUIg1mQ1HatP5RgV7GQBWT7EC
	0LMpJIzy/OWkz3MMcpQbempqiqevnRbUraCKkTAKFuHlNB6W4G/qhVgRlTEt+JDkGCYb
	nH1w13dPgcoUPTxrxYmf25oimnXT54XXTZ7DzuPN02g+CV6aN0aKYaNGPA/Dr7zBvu6D
	e63Q==
Received: by 10.68.218.97 with SMTP id pf1mr9358856pbc.96.1354315298982;
	Fri, 30 Nov 2012 14:41:38 -0800 (PST)
Received: by 10.68.218.97 with SMTP id pf1mr9358845pbc.96.1354315298829;
	Fri, 30 Nov 2012 14:41:38 -0800 (PST)
Received: from [192.168.88.206] ([199.223.125.134])
	by mx.google.com with ESMTPS id is6sm3668470pbc.55.2012.11.30.14.41.37
	(version=SSLv3 cipher=OTHER); Fri, 30 Nov 2012 14:41:37 -0800 (PST)
Message-ID: <50B93620.6050203@intel.com>
Date: Fri, 30 Nov 2012 14:41:36 -0800
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1353996801-28402-1-git-send-email-li.wang@windriver.com>
In-Reply-To: <1353996801-28402-1-git-send-email-li.wang@windriver.com>
X-Gm-Message-State: ALoCoQlRG86MjDnf5X9qkNvYsMgBA+zOZDI2NthT81AZBr/FWKgKGRgs0n52rc0sT/jaJ2rXCQwrgwgO39VCTKVW7DKLNboPRsVhGSCRVh22DLJA/WowUCIYuXJdP2uxJjo2nRuFrQ8S6Ys265zQrWlA+NAwk5vLhkVPEPC73ath6bUH9oL3d4AJr+FTz98t03llRCdrkSDa
Subject: Re: [PATCH] openssh: CVE-2011-4327
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
X-List-Received-Date: Fri, 30 Nov 2012 22:56:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/2012 10:13 PM, Li Wang wrote:
> A security flaw was found in the way ssh-keysign,
> a ssh helper program for host based authentication,
> attempted to retrieve enough entropy information on configurations that
> lacked a built-in entropy pool in OpenSSL (a ssh-rand-helper program would
> be executed to retrieve the entropy from the system environment).
> A local attacker could use this flaw to obtain unauthorized access to host keys
> via ptrace(2) process trace attached to the 'ssh-rand-helper' program.
>
> https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2011-4327
> http://www.openssh.com/txt/portable-keysign-rand-helper.adv
>
> [YOCTO #3493]
>
> Signed-off-by: Li Wang <li.wang@windriver.com>

Hi Li,

The second link you referenced above explains that the vulnerability 
exists in versions prior to openssh 5.8p2, and yet your patch was 
submitted against openssh 6.0p1. So it seems that this would not apply. 
Or am I misunderstanding the nature of the bug?

Thanks,

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


