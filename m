Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 82A2D60F15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2013 03:04:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAP34Vdw012316
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2013 19:04:31 -0800 (PST)
Received: from [128.224.162.213] (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Sun, 24 Nov 2013 19:04:30 -0800
Message-ID: <5292BE58.4040000@windriver.com>
Date: Mon, 25 Nov 2013 11:04:56 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1384483343.git.Qi.Chen@windriver.com>
In-Reply-To: <cover.1384483343.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.213]
Subject: Re: [PATCH V2 0/1] sanity.bbclass: check for validity of TMPDIR
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
X-List-Received-Date: Mon, 25 Nov 2013 03:04:31 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 11/15/2013 10:46 AM, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Changes since V1:
> 1. Create the directory hierarchy for TMPDIR only if TMPDIR is valid
> 2. Handle ABI version change only if TMPDIR has been created.
> 3. If we had a valid TMPDIR for last build and this time the TMPDIR hasn't
>     changed location, we don't check the validity for TMPDIR.
>
> The following changes since commit ea92671d9823e3667d6ced7ac2af20f991da404d:
>
>    bitbake: cooker: replace "w" file opening mode with "a" mode (2013-11-12 17:01:37 +0000)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib ChenQi/TMPDIR
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/TMPDIR
>
> Chen Qi (1):
>    sanity.bbclass: check for validity of TMPDIR
>
>   meta/classes/sanity.bbclass |   27 +++++++++++++++++++++++----
>   1 file changed, 23 insertions(+), 4 deletions(-)
>


