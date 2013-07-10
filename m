Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A23936AF4C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 08:48:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6A8mLv1016579
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 01:48:21 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Wed, 10 Jul 2013 01:48:21 -0700
Message-ID: <51DD1FD4.6090101@windriver.com>
Date: Wed, 10 Jul 2013 16:48:20 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1373440331.git.Qi.Chen@windriver.com>
	<afc49ee69b585666f57d826e2e5f526335f62835.1373440331.git.Qi.Chen@windriver.com>
	<51DD1C08.5020905@r-finger.com>
In-Reply-To: <51DD1C08.5020905@r-finger.com>
X-Originating-IP: [128.224.162.233]
Subject: Re: [PATCH 1/1] init-live.sh: allow users to choose the boot action
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
X-List-Received-Date: Wed, 10 Jul 2013 08:48:20 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2013 04:32 PM, Tomas Frydrych wrote:
> Hi,
>
> On 10/07/13 08:12, Qi.Chen@windriver.com wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> Previously, the boot action for live images was totally determined
>> by the LABEL value in the boot parameters (/proc/cmdline).
>>
>> This behavior is not very convenient for users. The user may just want
>> to drop to a shell for troubleshooting the live image, or the user may
>> want to try to install the live image while the LABEL value is 'boot'.
>>
>> We should provide the users a chance to choose the boot action when
>> the live image starts up.
> I am not entirely clear on why this is needed, the LABEL kernel cmdline
> parameter is set up by syslinux, and its value can be specified by the
> user from the syslinux prompt. If what you want is a more user friendly
> menu, then I think the correct solution would be to tweak the syslinux
> config, rather than to create a duplicate boot menu in the init script.
>
> Tomas
>
>
I agree.
Thanks for providing this info.

//Chen Qi

