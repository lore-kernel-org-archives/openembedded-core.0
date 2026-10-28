Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37043.1793167562434328101
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 23:06:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=tCbkclUf;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=xp5LVMLU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a1811d930a-aafdd6f0-9d75-4290-aede-5c4a38771892-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793167561;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=cQRa1F8R5rFgewpcfbGySzTSqC8xp01xFa/FfS0zNOo=;
	b=tCbkclUf7FH3zIG1fCNvzMrbKqEEtGb6/69las+9qaTMAZipwgSpSg++GGsrrTdl
	pfOYVQULozlG2LF75I5BeWV4z6TY4EJCsX9qtg18jLnQNHCWGDyvmVE8CRyHySj20zz
	6auZ5V4ZJ7mEVkoQVIb8zBpeyJ9Uus/mJEsMT52Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793167561;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=cQRa1F8R5rFgewpcfbGySzTSqC8xp01xFa/FfS0zNOo=;
	b=xp5LVMLUF9UKccRD7QjXfvPbca+eVznQK+tD6KML6tQr6pY31a5juzMIf+fkIqcF
	YbvntcrILb/MUpQxsmJUnXwK084nQH9SD/hn8lKJVrt840LVME0ebUAnLwSVv5gAmAp
	rn0nrePkjmP/iVranwqFg07z3YpUg30fZ8ecRuG4=
Content-Type: multipart/mixed; boundary="===============5489930151370747201=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libjpeg-turbo: upgrading to 3.2.1 FAILED
Message-ID: <010101a1811d930a-aafdd6f0-9d75-4290-aede-5c4a38771892-000000@us-west-2.amazonses.com>
Date: Wed, 28 Oct 2026 06:06:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.28-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 06:06:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248781

--===============5489930151370747201==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libjpeg-turbo* to *3.2.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libjpeg-turbo failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 958 .bb files complete (0 cached, 958 parsed). 1997 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-bfb95a69ba79f3d3c5df567d57a6a55cf6087dcf"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:bfb95a69ba79f3d3c5df567d57a6a55cf6087dcf"
meta-yocto-bsp       
meta-poky            = "master:82013b83db7ba41da07694e201a7c43f561a9e00"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 959 .bb files complete (0 cached, 959 parsed). 1998 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-bfb95a69ba79f3d3c5df567d57a6a55cf6087dcf"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:bfb95a69ba79f3d3c5df567d57a6a55cf6087dcf"
meta-yocto-bsp       
meta-poky            = "master:82013b83db7ba41da07694e201a7c43f561a9e00"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://github.com/libjpeg-turbo/libjpeg-turbo/releases//download/3.2.1/libjpeg-turbo-3.2.1.tar.gz...
INFO: Rebasing devtool onto 2a672de1ce38e7c2baa1240ece6ffff5e717d1d0
WARNING: Command 'git rebase 2a672de1ce38e7c2baa1240ece6ffff5e717d1d0' failed:
Auto-merging release/Config.cmake.in
CONFLICT (content): Merge conflict in release/Config.cmake.in

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/libjpeg-turbo
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libjpeg-turbo/libjpeg-turbo_3.2.1.bb
INFO: Changelog extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/libjpeg-turbo.txt
INFO: Changelog metadata written to /srv/pokybuild/yocto-worker/auh/build/build/workspace/changelogs/libjpeg-turbo.json



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5489930151370747201==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libjpeg-turbo-changelog.txt"

3.2.1
=====

### Significant changes relative to 3.2.0:

1. Fixed a regression introduced by 3.2 beta1[9] that broke Un*x builds in
which position-independent code (PIC) was not enabled for static libraries.
This issue could be worked around by explicitly setting the
`CMAKE_POSITION_INDEPENDENT_CODE` CMake variable or using a toolchain, such as
the ones provided by Ubuntu, that automatically enables PIC.

2. The RISC-V Vector (RVV) forward DCT modules now use strided segment load
intrinsics to simultaneously load sample rows from memory and transpose them
into columns, as well as multiply-accumulate intrinsics where appropriate.
When using the accurate integer DCT algorithm, RGB-to-baseline JPEG compression
is approximately 10-17% (avg. 13%) faster (relative to libjpeg-turbo 3.2.0)
with GCC 14 and 1-8% (avg. 4%) faster with Clang 20.  (Tested on a 1.6 GHz Ky
X1 CPU.  Actual mileage may vary.)

3. Symbols from the in-tree zlib and libspng implementations introduced by
3.2 beta1[9] are now hidden, which prevents the symbols from being exposed in
downstream shared libraries and applications that link with the static
TurboJPEG API library.  Symbols from the in-tree zlib implementation are now
also renamed, which prevents downstream shared libraries and applications that
link with the static TurboJPEG API library from accidentally calling the
in-tree zlib implementation when they intend to call the system-supplied zlib
implementation.

4. Fixed an integer overflow and subsequent buffer overrun that occurred when
attempting to use `tj3LoadImage12()` or `tj3LoadImage16()` from a 32-bit build
of libjpeg-turbo to load a packed-pixel image with more than 2^31 components.

5. Fixed a division-by-zero error (CVE-2026-75466) that occurred when
attempting to load a non-grayscale indexed-color PNG image using
`tj3LoadImage*()` if the pixel format of the packed-pixel buffer was
unspecified (`TJPF_UNKNOWN`.)

6. Fixed an issue whereby `tj3DecompressToYUV*()` produced incorrect
chrominance values when decompressing a 4:2:0, 4:1:0, or 2:4 JPEG image with
the "fast" IDCT algorithm and a scaling factor of 1/2.  (In other words,
`TJPARAM_FASTDCT` was not ignored as it should be when decompression scaling is
enabled.)

7. Fixed a buffer overrun and subsequent segfault that occurred on certain
platforms when attempting to partially decompress a specially-crafted 4:2:0
JPEG image using the merged (non-fancy) upsampling algorithm with the
libjpeg-turbo SIMD extensions disabled and a cropping region that would have
caused any of the component planes to be cropped to a width of 1 or 2 samples.

8. Hardened the libjpeg API against hypothetical applications that may
erroneously attempt to decompress a full-color 12-bit-per-sample JPEG image
with both one-pass color quantization and RGB565 color conversion enabled.
This could have caused a buffer overrun in one of the quantizer's color index
arrays.  The buffer overrun did not likely pose a security risk, since an
application that abused the API in the aforementioned manner could never work
properly.

9. Fixed issues in `jpeg*_skip_scanlines()` whereby, when skipping certain
groups of scanlines while using a non-fancy (merged or plain) upsampling
algorithm with a vertical sampling factor greater than 1, the wrong number of
scanlines were skipped and/or skipped scanlines were returned in subsequent
calls to `jpeg*_read_scanlines()`.

10. Hardened the TurboJPEG API against hypothetical applications that may
erroneously pass an invalid image to `tj3DecompressHeader()`, ignore a fatal
error thrown by that function, and attempt to call the function again with a
valid image.  Under certain circumstances, this could have caused the values of
`TJPARAM_JPEGWIDTH` and `TJPARAM_JPEGHEIGHT` to reflect the dimensions reported
in the invalid image's header rather than the valid image's header, which might
have caused the caller to allocate too small of a buffer to hold the
decompressed valid image.

11. `tj3DecompressHeader()` now always removes the ICC profile (if any) that
was previously extracted into the TurboJPEG instance.  This addresses an
oversight in 3.2 beta1[10] whereby, if the same TurboJPEG instance was used to
decompress or transform multiple JPEG images, then `tj3GetICCProfile()` and
`tj3TransformBufSize()` behaved as if JPEG images with no ICC profile contained
the last ICC profile extracted.

12. `tj3TransformBufSize()` has been improved in the following ways:

     - The function now accounts for the size of all extra markers (including
comments, JFIF thumbnails, and Exif data) that will be copied from the source
image to the destination image, given the current value of
`TJPARAM_SAVEMARKERS` and the specified transform options.
     - The function now returns accurate results regardless of the value of
`TJPARAM_SAVEMARKERS` at the time `tj3DecompressHeader()` was called.  This
reflects the fact that only the current value of `TJPARAM_SAVEMARKERS` and the
specified transform options affect the marker copying behavior in
`tj3Transform()`.

13. Fixed issues in jpegtran that prevented a grayscale image from being
dropped into a subsampled input image or vice versa.

14. Hardened the TurboJPEG API against hypothetical applications that may
erroneously attempt to use the same insufficiently large pre-allocated
destination buffer for multiple simultaneous transform operations in
`tj3Transform()`.  This caused a use-after-free issue, because the
caller-specified destination buffer was no longer valid after the first
transform operation reallocated it.

15. Fixed multiple issues in the standalone (non-merged) RGB565 color
converters that occurred when attempting to decompress more than one scanline
at a time from a vertically subsampled JPEG image.  These issues caused a
buffer overrun and subsequent segfault if the output image rows were not 4-byte
aligned, the image width was 1, and both the vertical sampling factor and the
number of scanlines decompressed at a time were greater than 2.  In other
cases, the issues caused incorrect dithered output.  The issues could not be
reproduced using djpeg (which decompresses one scanline at a time) and were not
known to exist in any other applications.

--===============5489930151370747201==--
