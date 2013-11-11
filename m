Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F1F7F6D12A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 12:53:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rABCrKqk025484
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 11 Nov 2013 04:53:20 -0800 (PST)
Received: from [128.224.162.213] (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Mon, 11 Nov 2013 04:53:19 -0800
Message-ID: <5280D343.6070806@windriver.com>
Date: Mon, 11 Nov 2013 20:53:23 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1383974819.git.Qi.Chen@windriver.com>
	<74d67107ced2e10a00bc2ff9b84d42a7376fabae.1383974819.git.Qi.Chen@windriver.com>
	<1384038034.3798.46.camel@x121e.pbcl.net>
	<52804662.1090605@windriver.com>
	<CAJTo0LZ3UVtckp+FV+_GC6y48L3XrU33W-xVTkH5AE9_E+Agcg@mail.gmail.com>
In-Reply-To: <CAJTo0LZ3UVtckp+FV+_GC6y48L3XrU33W-xVTkH5AE9_E+Agcg@mail.gmail.com>
X-Originating-IP: [128.224.162.213]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/8] initscripts: add setup-commands.sh
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
X-List-Received-Date: Mon, 11 Nov 2013 12:53:23 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/2013 08:12 PM, Burton, Ross wrote:
> On 11 November 2013 02:52, ChenQi <Qi.Chen@windriver.com> wrote:
>> The problem here is that the init scripts under /etc/rcS.d/ need to execute
>> commands like awk, dirname, and readlink which are from /usr.
> Yes.  So why do you really need to support split /usr, and why isn't
> an initramfs a suitable alternative?  People seem to insist that split
> /usr is trivial but these patches are clearly showing it's not.
>
> Ross
>
>

If /usr is going to be mounted, we don't have any problem here because 
mountall.sh takes place really early. In this situation, splitting /usr 
is trivial.

What I want to do here is to make system boot up even if /usr is totally 
missing.
Do you think it's suitable for us to support such use case?

Best Regards,
Chen Qi


