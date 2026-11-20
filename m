Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1167.1795158391998156932
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 23:06:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DAC/VnfB;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=r+sDyIrO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a1f7c739b9-32a320c0-77bf-47d5-8ab8-5c91807550b9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1795158391;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=kLxkIE19RHfEko7axGm0abZwNfFuXypwjiVIAFvmTdw=;
	b=DAC/VnfBX1Phw+REkrOV0OZB0EBTFQ6DkswA8OCJ1LSp29fyzNveOQ48YztYc790
	vKMPRymRA4OG0jq4vePFIdUecB322WsYrQnzRd5Tq/FwbyK1VyO8tu/k8RSXxRdlCh6
	JOfm4UkTNGGbIuH6mfyasPQdXnSFXdJc+PcFDJaM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795158391;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=kLxkIE19RHfEko7axGm0abZwNfFuXypwjiVIAFvmTdw=;
	b=r+sDyIrOlUwej7c2cp5fuhA4d5DJUmvj6LMMQ9ahx6Y2q+QaB5uRlDrEPQDhSuXe
	3g8f8CiKYzB2VjknfBwuzSME2PdrUKx6m5chQxXvTts/XY+jM46jWfCdkaKBc3xA/B2
	njdcr0YwArY1BUJRh2NuD4iV2wUFWjzA9a/m79R8=
Content-Type: multipart/mixed; boundary="===============4220158535985380648=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] ffmpeg: upgrading to 9.1 FAILED
Message-ID: <010101a1f7c739b9-32a320c0-77bf-47d5-8ab8-5c91807550b9-000000@us-west-2.amazonses.com>
Date: Fri, 20 Nov 2026 07:06:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.20-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 07:06:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250735

--===============4220158535985380648==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ffmpeg* to *9.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe ffmpeg failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 963 .bb files complete (0 cached, 963 parsed). 2014 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-3358cf5ece1ed7d90014dd3b83de72a3f0ed6c4f"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:3358cf5ece1ed7d90014dd3b83de72a3f0ed6c4f"
meta-yocto-bsp       
meta-poky            = "master:6ee74fbbe3a36dabb7f8f85ee10691eaf8aa3252"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 2 Local 2 Mirrors 0 Missed 0 Current 28 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 964 .bb files complete (0 cached, 964 parsed). 2015 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-3358cf5ece1ed7d90014dd3b83de72a3f0ed6c4f"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:3358cf5ece1ed7d90014dd3b83de72a3f0ed6c4f"
meta-yocto-bsp       
meta-poky            = "master:6ee74fbbe3a36dabb7f8f85ee10691eaf8aa3252"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   3% |#                                   | ETA:  0:00:03
Adding changed files:   7% |##                                  | ETA:  0:00:02
Adding changed files:  11% |####                                | ETA:  0:00:01
Adding changed files:  15% |#####                               | ETA:  0:00:01
Adding changed files:  19% |#######                             | ETA:  0:00:01
Adding changed files:  23% |########                            | ETA:  0:00:01
Adding changed files:  27% |#########                           | ETA:  0:00:01
Adding changed files:  31% |###########                         | ETA:  0:00:01
Adding changed files:  35% |############                        | ETA:  0:00:01
Adding changed files:  39% |##############                      | ETA:  0:00:01
Adding changed files:  43% |###############                     | ETA:  0:00:01
Adding changed files:  47% |#################                   | ETA:  0:00:01
Adding changed files:  51% |##################                  | ETA:  0:00:00
Adding changed files:  55% |###################                 | ETA:  0:00:00
Adding changed files:  59% |#####################               | ETA:  0:00:00
Adding changed files:  63% |######################              | ETA:  0:00:00
Adding changed files:  67% |########################            | ETA:  0:00:00
Adding changed files:  71% |#########################           | ETA:  0:00:00
Adding changed files:  75% |###########################         | ETA:  0:00:00
Adding changed files:  79% |############################        | ETA:  0:00:00
Adding changed files:  83% |#############################       | ETA:  0:00:00
Adding changed files:  87% |###############################     | ETA:  0:00:00
Adding changed files:  91% |################################    | ETA:  0:00:00
Adding changed files:  95% |##################################  | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:01
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.ffmpeg.org/releases/ffmpeg-9.1.tar.xz...
INFO: Rebasing devtool onto 867a5d7e067cd6898887b030139f23e74abca304
WARNING: Command 'git rebase 867a5d7e067cd6898887b030139f23e74abca304' failed:
Auto-merging ffbuild/common.mak
CONFLICT (content): Merge conflict in ffbuild/common.mak

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/ffmpeg
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/ffmpeg/ffmpeg_9.1.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/ffmpeg.txt
INFO: Changelog metadata written to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/ffmpeg.json



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4220158535985380648==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="ffmpeg-changelog.txt"

version 9.1:
- ASTC image encoding and decoding via libastcenc, with .astc and KTX 1.0 muxers
  and demuxers
- extensively improved AAC encoder
- APV Vulkan encoder
- iTerm2 inline image protocol muxer
- LCEVC payload merging bitstream filter
- Graph based bitstream filtering API
- ffmpeg CLI dual track LCEVC handling
- MVR demuxer
- latticepal filter
- Add AMF Video Quality Enhancer (vf_vqe_amf) filter
- NVDEC CUARRAY hwaccels
- libcurl protocol
- DVD-Audio LPCM decoder and demuxing support
- AVFoundation input device selection by unique ID and USB serial number
- NVIDIA optical flow accelerated interpolation filter (vf_fruc_vulkan)
- H.264 data partitioning support
- DSD (dsd_msbf) encoder
- trim bitstream filter
- Rhetorex ADPCM decoder
- gainmap filter
- JPEG Multi-Picture Format muxer
- ADPCM IMA Citrix decoder
- Panasonic RW2 decoder
- Windows handle protocol
- xHE-AAC encoding via libfdk-xhe-aac
- jpegapp bitstream filter
- LCEVC track muxing support in MPEG-TS muxer
- Infinity IMM6 video decoder
- Remove the asf_o demuxer
- D3D12 DirectML zero-copy inference for the ONNX Runtime DNN backend
- side_data bitstream filter
- JPEG Multi-Picture Format demuxer

--===============4220158535985380648==--
