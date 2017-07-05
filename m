Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 1110760777
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jul 2017 10:24:40 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v65AOad1022234
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Wed, 5 Jul 2017 12:24:36 +0200
Received: from [139.16.24.200] ([139.16.24.200])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id v65AOZoV012671;
	Wed, 5 Jul 2017 12:24:35 +0200
To: kai.kang@windriver.com, openembedded-core@lists.openembedded.org
References: <cover.1499241206.git.kai.kang@windriver.com>
	<f66a80ddb1ba569ce0e27d561d776a260601ef3d.1499241206.git.kai.kang@windriver.com>
From: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <1d11e552-59aa-63e9-eaa7-e0798667c5cb@siemens.com>
Date: Wed, 5 Jul 2017 12:24:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <f66a80ddb1ba569ce0e27d561d776a260601ef3d.1499241206.git.kai.kang@windriver.com>
Subject: Re: [PATCH 1/2] openssl: disable weak ciphers
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
X-List-Received-Date: Wed, 05 Jul 2017 10:24:41 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit


On 05.07.2017 09:58, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> Check distro feature 'openssl-no-weak-ciphers' to disable weak ciphers
> provided by openssl:
>
> * des
> * ec
> * ecdh
> * ecdsa
> * md2
> * mdc2
Why are the elliptic curve ciphers considered weak?
I'm wondering because Mozilla (https://wiki.mozilla.org/Security/Server_Side_TLS) is recommending ECDSA.

Pascal


