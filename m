Return-Path: <leandro.maciel.dorileo@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1BF1173C5B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 17:01:21 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 05 May 2015 10:00:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,373,1427785200"; d="scan'208";a="705633272"
Received: from unknown (HELO [10.218.100.121]) ([10.218.100.121])
	by fmsmga001.fm.intel.com with ESMTP; 05 May 2015 10:00:51 -0700
Message-ID: <5548F741.5050809@intel.com>
Date: Tue, 05 May 2015 14:00:49 -0300
From: Leandro Dorileo <leandro.maciel.dorileo@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1430775804-30845-1-git-send-email-bruno.bottazzini@intel.com>
In-Reply-To: <1430775804-30845-1-git-send-email-bruno.bottazzini@intel.com>
Subject: Re: [PATCH V2 0/3] systemd and dbus: split modules into packages
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
X-List-Received-Date: Tue, 05 May 2015 17:01:22 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bruno,

Now I think the patchset looks way much better.

Thanks...

--
Dorileo



On 05/04/2015 06:43 PM, Bruno Bottazzini wrote:
> Differences from V1:
> - Making sure that we don't change default configuration as Anders and
>    Otavio suggested.
> - Changing EXTRA_OECONF flags to use it with PAKAGECONFIG as Anders pointed
>    in the review.
> - New patch that verifies if journal-flush.service exists.
>    It may not exists depending on package configuration that the users want to
>    be installed or removed.
>
> Bruno Bottazzini (2):
>    systemd: Verify if journal-flush.service exists.
>    systemd: split modules into packages
>
> Gustavo Sverzut Barbieri (1):
>    dbus: split tools package.
>
>   meta/recipes-core/dbus/dbus.inc          |    9 +-
>   meta/recipes-core/systemd/systemd_219.bb | 1146 ++++++++++++++++++++++++++----
>   2 files changed, 1025 insertions(+), 130 deletions(-)
>
> --
> 2.3.7
>


