Return-Path: <ml@communistcode.co.uk>
X-Greylist: delayed 2484 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 06 Jan 2015 13:30:33 UTC
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id E443B7289C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jan 2015 13:30:33 +0000 (UTC)
Message-ID: <54ABD99A.3020401@communistcode.co.uk>
Date: Tue, 06 Jan 2015 12:48:26 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1413018367.git.hongxu.jia@windriver.com>
In-Reply-To: <cover.1413018367.git.hongxu.jia@windriver.com>
Subject: Re: [PATCH 0/1] file: add wrapper to nativesdk-file
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Jan 2015 13:30:36 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 11/10/14 10:07, Hongxu Jia wrote:
> The following changes since commit 0172cded27d73437784fe1578110937aede563eb:
> 
>   build-appliance-image: Update to dizzy head revision (2014-10-10 22:40:57 +0100)
> 
> are available in the git repository at:
> 
>   git://git.pokylinux.org/poky-contrib hongxu/fix-nativesdk-file
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-nativesdk-file
> 
> Hongxu Jia (1):
>   file: add wrapper to nativesdk-file
> 
>  meta/recipes-devtools/file/file_5.18.bb | 5 +++++
>  1 file changed, 5 insertions(+)
> 

With my most recent oe build I'm getting an error when trying to use
file from the SDK. My target machine is x86 and my SDK is x86_64.

Is anybody else seeing this?

[jmitchell@newvsbuild filetest]$ file test.txt

eng/jmitchell/oe-sensors/sdk/sysroots/x86_64-oecore-linux/usr/share/misc/magic.mgc,
1: Warning: offset `�
    ' invalid
/eng/jmitchell/oe-sensors/sdk/sysroots/x86_64-oecore-linux/usr/share/misc/magic.mgc,
1: Warning: type `�
  ' invalid
/eng/jmitchell/oe-sensors/sdk/sysroots/x86_64-oecore-linux/usr/share/misc/magic.mgc,
6: Warning: offset `Firmware v' invalid
/eng/jmitchell/oe-sensors/sdk/sysroots/x86_64-oecore-linux/usr/share/misc/magic.mgc,
6: Warning: type `Firmware v' invalid

......

/eng/jmitchell/oe-sensors/sdk/sysroots/x86_64-oecore-linux/usr/share/misc/magic.mgc,
1916: Warning: type `.' invalid

file: Size of
`/eng/jmitchell/oe-sensors/sdk/sysroots/x86_64-oecore-linux/usr/share/misc/magic.mgc'
3043460 is not a multiple of 248


-- 
  Jack Mitchell (jack@embed.me.uk)
  Embedded Systems Engineer
  Cambridgeshire, UK
  http://www.embed.me.uk
-- 

