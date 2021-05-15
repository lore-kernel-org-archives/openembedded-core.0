Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.4465.1621074783516824425
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id EBCBF38C0832
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:03 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lttng-modules: upgrading to 2.12.6 FAILED
Message-ID: <MADEUP.167F36EDC18ED99D.8589@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============0157728888832763143=="

--===============0157728888832763143==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lttng-modules* to *2.12.6* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe lttng-modules failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1459 entries from dependency cache.
INFO: Extracting current version source...
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-721761fc1d1aaf3c040697ac83b89283b39a9a4b"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:721761fc1d1aaf3c040697ac83b89283b39a9a4b"
workspace            = "master:ed2e3b739a7e0e8daad665fed01342d60674d6b7"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Network 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting upgraded version source...
INFO: Fetching https://lttng.org/files/lttng-modules/lttng-modules-2.12.6.tar.bz2...
Loading cache...done.
Loaded 1459 entries from dependency cache.
Parsing recipes...done.
Parsing of 826 .bb files complete (824 cached, 2 parsed). 1460 targets, 31 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-721761fc1d1aaf3c040697ac83b89283b39a9a4b"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:721761fc1d1aaf3c040697ac83b89283b39a9a4b"
workspace            = "master:ed2e3b739a7e0e8daad665fed01342d60674d6b7"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Network 0 Missed 0 Current 0 (0% match, 0% complete)
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
WARNING: Command 'git rebase 18d02a3bc5829892780c8bd2561d8af2fb24871a' failed:
Rebasing (1/8)
Rebasing (2/8)
dropping 3d87e29775947708a6bb3e9cd7301398bd4691a3 Fix: memory leaks on event destroy -- patch contents already upstream
Rebasing (3/8)
dropping 41b2a6ff63abe698f1fb43191229029c6f9f25ac Fix: filter interpreter early-exits on uninitialized value -- patch contents already upstream
Rebasing (4/8)
error: could not apply 5e96c97... fix: mm, tracing: record slab name for kmem_cache_free() (v5.12)
Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".
Could not apply 5e96c97... fix: mm, tracing: record slab name for kmem_cache_free() (v5.12)
Auto-merging instrumentation/events/lttng-module/kmem.h
CONFLICT (content): Merge conflict in instrumentation/events/lttng-module/kmem.h

You will need to resolve conflicts in order to complete the upgrade.

--2021-05-15 08:11:49--  http://downloads.yoctoproject.org/mirror/sources/git2_git.lttng.org.lttng-modules.tar.gz
Resolving downloads.yoctoproject.org (downloads.yoctoproject.org)... 172.29.10.13
Connecting to downloads.yoctoproject.org (downloads.yoctoproject.org)|172.29.10.13|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2021-05-15 08:11:49 ERROR 404: Not Found.

Cloning into bare repository '/home/pokybuild/yocto-worker/auh/build/build/build/downloads/git2/git.lttng.org.lttng-modules'...
remote: Enumerating objects: 19021, done.        
remote: Counting objects:   0% (1/19021)        
remote: Counting objects:   1% (191/19021)        
remote: Counting objects:   2% (381/19021)        
remote: Counting objects:   3% (571/19021)        
remote: Counting objects:   4% (761/19021)        
remote: Counting objects:   5% (952/19021)        
remote: Counting objects:   6% (1142/19021)        
remote: Counting objects:   7% (1332/19021)        
remote: Counting objects:   8% (1522/19021)        
remote: Counting objects:   9% (1712/19021)        
remote: Counting objects:  10% (1903/19021)        
remote: Counting objects:  11% (2093/19021)        
remote: Counting objects:  12% (2283/19021)        
remote: Counting objects:  13% (2473/19021)        
remote: Counting objects:  14% (2663/19021)        
remote: Counting objects:  15% (2854/19021)        
remote: Counting objects:  16% (3044/19021)        
remote: Counting objects:  17% (3234/19021)        
remote: Counting objects:  18% (3424/19021)        
remote: Counting objects:  19% (3614/19021)        
remote: Counting objects:  20% (3805/19021)        
remote: Counting objects:  21% (3995/19021)        
remote: Counting objects:  22% (4185/19021)        
remote: Counting objects:  23% (4375/19021)        
remote: Counting objects:  24% (4566/19021)        
remote: Counting objects:  25% (4756/19021)        
remote: Counting objects:  26% (4946/19021)        
remote: Counting objects:  27% (5136/19021)        
remote: Counting objects:  28% (5326/19021)        
remote: Counting objects:  29% (5517/19021)        
remote: Counting objects:  30% (5707/19021)        
remote: Counting objects:  31% (5897/19021)        
remote: Counting objects:  32% (6087/19021)        
remote: Counting objects:  33% (6277/19021)        
remote: Counting objects:  34% (6468/19021)        
remote: Counting objects:  35% (6658/19021)        
remote: Counting objects:  36% (6848/19021)        
remote: Counting objects:  37% (7038/19021)        
remote: Counting objects:  38% (7228/19021)        
remote: Counting objects:  39% (7419/19021)        
remote: Counting objects:  40% (7609/19021)        
remote: Counting objects:  41% (7799/19021)        
remote: Counting objects:  42% (7989/19021)        
remote: Counting objects:  43% (8180/19021)        
remote: Counting objects:  44% (8370/19021)        
remote: Counting objects:  45% (8560/19021)        
remote: Counting objects:  46% (8750/19021)        
remote: Counting objects:  47% (8940/19021)        
remote: Counting objects:  48% (9131/19021)        
remote: Counting objects:  49% (9321/19021)        
remote: Counting objects:  50% (9511/19021)        
remote: Counting objects:  51% (9701/19021)        
remote: Counting objects:  52% (9891/19021)        
remote: Counting objects:  53% (10082/19021)        
remote: Counting objects:  54% (10272/19021)        
remote: Counting objects:  55% (10462/19021)        
remote: Counting objects:  56% (10652/19021)        
remote: Counting objects:  57% (10842/19021)        
remote: Counting objects:  58% (11033/19021)        
remote: Counting objects:  59% (11223/19021)        
remote: Counting objects:  60% (11413/19021)        
remote: Counting objects:  61% (11603/19021)        
remote: Counting objects:  62% (11794/19021)        
remote: Counting objects:  63% (11984/19021)        
remote: Counting objects:  64% (12174/19021)        
remote: Counting objects:  65% (12364/19021)        
remote: Counting objects:  66% (12554/19021)        
remote: Counting objects:  67% (12745/19021)        
remote: Counting objects:  68% (12935/19021)        
remote: Counting objects:  69% (13125/19021)        
remote: Counting objects:  70% (13315/19021)        
remote: Counting objects:  71% (13505/19021)        
remote: Counting objects:  72% (13696/19021)        
remote: Counting objects:  73% (13886/19021)        
remote: Counting objects:  74% (14076/19021)        
remote: Counting objects:  75% (14266/19021)        
remote: Counting objects:  76% (14456/19021)        
remote: Counting objects:  77% (14647/19021)        
remote: Counting objects:  78% (14837/19021)        
remote: Counting objects:  79% (15027/19021)        
remote: Counting objects:  80% (15217/19021)        
remote: Counting objects:  81% (15408/19021)        
remote: Counting objects:  82% (15598/19021)        
remote: Counting objects:  83% (15788/19021)        
remote: Counting objects:  84% (15978/19021)        
remote: Counting objects:  85% (16168/19021)        
remote: Counting objects:  86% (16359/19021)        
remote: Counting objects:  87% (16549/19021)        
remote: Counting objects:  88% (16739/19021)        
remote: Counting objects:  89% (16929/19021)        
remote: Counting objects:  90% (17119/19021)        
remote: Counting objects:  91% (17310/19021)        
remote: Counting objects:  92% (17500/19021)        
remote: Counting objects:  93% (17690/19021)        
remote: Counting objects: 100% (19021/19021), done.        
remote: Compressing objects:   0% (1/8096)        
remote: Compressing objects:   1% (81/8096)        
remote: Compressing objects:   2% (162/8096)        
remote: Compressing objects:   3% (243/8096)        
remote: Compressing objects:   4% (324/8096)        
remote: Compressing objects:   5% (405/8096)        
remote: Compressing objects:   6% (486/8096)        
remote: Compressing objects:   7% (567/8096)        
remote: Compressing objects:   8% (648/8096)        
remote: Compressing objects:   9% (729/8096)        
remote: Compressing objects:  10% (810/8096)        
remote: Compressing objects:  11% (891/8096)        
remote: Compressing objects:  12% (972/8096)        
remote: Compressing objects:  13% (1053/8096)        
remote: Compressing objects:  14% (1134/8096)        
remote: Compressing objects:  15% (1215/8096)        
remote: Compressing objects:  16% (1296/8096)        
remote: Compressing objects:  17% (1377/8096)        
remote: Compressing objects:  18% (1458/8096)        
remote: Compressing objects:  19% (1539/8096)        
remote: Compressing objects:  20% (1620/8096)        
remote: Compressing objects:  21% (1701/8096)        
remote: Compressing objects:  22% (1782/8096)        
remote: Compressing objects:  23% (1863/8096)        
remote: Compressing objects:  24% (1944/8096)        
remote: Compressing objects:  25% (2024/8096)        
remote: Compressing objects:  26% (2105/8096)        
remote: Compressing objects:  27% (2186/8096)        
remote: Compressing objects:  28% (2267/8096)        
remote: Compressing objects:  29% (2348/8096)        
remote: Compressing objects:  30% (2429/8096)        
remote: Compressing objects:  31% (2510/8096)        
remote: Compressing objects:  32% (2591/8096)        
remote: Compressing objects:  33% (2672/8096)        
remote: Compressing objects:  34% (2753/8096)        
remote: Compressing objects:  35% (2834/8096)        
remote: Compressing objects:  36% (2915/8096)        
remote: Compressing objects:  37% (2996/8096)        
remote: Compressing objects:  38% (3077/8096)        
remote: Compressing objects:  39% (3158/8096)        
remote: Compressing objects:  40% (3239/8096)        
remote: Compressing objects:  41% (3320/8096)        
remote: Compressing objects:  42% (3401/8096)        
remote: Compressing objects:  43% (3482/8096)        
remote: Compressing objects:  44% (3563/8096)        
remote: Compressing objects:  45% (3644/8096)        
remote: Compressing objects:  46% (3725/8096)        
remote: Compressing objects:  47% (3806/8096)        
remote: Compressing objects:  48% (3887/8096)        
remote: Compressing objects:  49% (3968/8096)        
remote: Compressing objects:  50% (4048/8096)        
remote: Compressing objects:  51% (4129/8096)        
remote: Compressing objects:  52% (4210/8096)        
remote: Compressing objects:  53% (4291/8096)        
remote: Compressing objects:  54% (4372/8096)        
remote: Compressing objects:  55% (4453/8096)        
remote: Compressing objects:  56% (4534/8096)        
remote: Compressing objects:  57% (4615/8096)        
remote: Compressing objects:  58% (4696/8096)        
remote: Compressing objects:  59% (4777/8096)        
remote: Compressing objects:  60% (4858/8096)        
remote: Compressing objects:  61% (4939/8096)        
remote: Compressing objects:  62% (5020/8096)        
remote: Compressing objects:  63% (5101/8096)        
remote: Compressing objects:  64% (5182/8096)        
remote: Compressing objects:  65% (5263/8096)        
remote: Compressing objects:  66% (5344/8096)        
remote: Compressing objects:  67% (5425/8096)        
remote: Compressing objects:  68% (5506/8096)        
remote: Compressing objects:  69% (5587/8096)        
remote: Compressing objects:  70% (5668/8096)        
remote: Compressing objects:  71% (5749/8096)        
remote: Compressing objects:  72% (5830/8096)        
remote: Compressing objects:  73% (5911/8096)        
remote: Compressing objects:  74% (5992/8096)        
remote: Compressing objects:  75% (6072/8096)        
remote: Compressing objects:  76% (6153/8096)        
remote: Compressing objects:  77% (6234/8096)        
remote: Compressing objects:  78% (6315/8096)        
remote: Compressing objects:  79% (6396/8096)        
remote: Compressing objects:  80% (6477/8096)        
remote: Compressing objects:  81% (6558/8096)        
remote: Compressing objects:  82% (6639/8096)        
remote: Compressing objects:  83% (6720/8096)        
remote: Compressing objects:  84% (6801/8096)        
remote: Compressing objects:  85% (6882/8096)        
remote: Compressing objects:  86% (6963/8096)        
remote: Compressing objects:  87% (7044/8096)        
remote: Compressing objects:  88% (7125/8096)        
remote: Compressing objects:  89% (7206/8096)        
remote: Compressing objects:  90% (7287/8096)        
remote: Compressing objects:  91% (7368/8096)        
remote: Compressing objects:  92% (7449/8096)        
remote: Compressing objects: 100% (8096/8096), done.        
Receiving objects:   0% (1/19021)
Receiving objects:   1% (191/19021)
Receiving objects:   2% (381/19021)
Receiving objects:   3% (571/19021)
Receiving objects:   4% (761/19021)
Receiving objects:   5% (952/19021)
Receiving objects:   6% (1142/19021)
Receiving objects:   7% (1332/19021)
Receiving objects:   8% (1522/19021)
Receiving objects:   9% (1712/19021)
Receiving objects:  10% (1903/19021)
Receiving objects:  11% (2093/19021)
Receiving objects:  12% (2283/19021)
Receiving objects:  13% (2473/19021)
Receiving objects:  14% (2663/19021)
Receiving objects:  15% (2854/19021)
Receiving objects:  16% (3044/19021)
Receiving objects:  17% (3234/19021)
Receiving objects:  18% (3424/19021)
Receiving objects:  19% (3614/19021)
Receiving objects:  20% (3805/19021)
Receiving objects:  21% (3995/19021)
Receiving objects:  22% (4185/19021)
Receiving objects:  23% (4375/19021)
Receiving objects:  24% (4566/19021)
Receiving objects:  25% (4756/19021)
Receiving objects:  26% (4946/19021)
Receiving objects:  27% (5136/19021)
Receiving objects:  28% (5326/19021)
Receiving objects:  29% (5517/19021)
Receiving objects:  30% (5707/19021)
Receiving objects:  31% (5897/19021)
Receiving objects:  32% (6087/19021)
Receiving objects:  33% (6277/19021)
Receiving objects:  34% (6468/19021)
Receiving objects:  35% (6658/19021)
Receiving objects:  36% (6848/19021)
Receiving objects:  37% (7038/19021)
Receiving objects:  38% (7228/19021)
Receiving objects:  39% (7419/19021)
Receiving objects:  40% (7609/19021)
Receiving objects:  41% (7799/19021)
Receiving objects:  42% (7989/19021)
Receiving objects:  43% (8180/19021)
Receiving objects:  44% (8370/19021)
Receiving objects:  45% (8560/19021)
Receiving objects:  46% (8750/19021)
Receiving objects:  47% (8940/19021)
Receiving objects:  48% (9131/19021)
Receiving objects:  49% (9321/19021)
Receiving objects:  50% (9511/19021)
Receiving objects:  51% (9701/19021)
Receiving objects:  52% (9891/19021)
Receiving objects:  53% (10082/19021)
Receiving objects:  54% (10272/19021)
Receiving objects:  55% (10462/19021)
Receiving objects:  56% (10652/19021)
Receiving objects:  57% (10842/19021)
Receiving objects:  58% (11033/19021)
Receiving objects:  59% (11223/19021)
Receiving objects:  60% (11413/19021)
Receiving objects:  61% (11603/19021)
Receiving objects:  62% (11794/19021)
Receiving objects:  63% (11984/19021)
Receiving objects:  64% (12174/19021)
Receiving objects:  65% (12364/19021)
Receiving objects:  66% (12554/19021)
Receiving objects:  67% (12745/19021)
Receiving objects:  68% (12935/19021)
Receiving objects:  69% (13125/19021)
Receiving objects:  70% (13315/19021)
Receiving objects:  71% (13505/19021)
Receiving objects:  72% (13696/19021)
Receiving objects:  73% (13886/19021)
Receiving objects:  74% (14076/19021)
Receiving objects:  75% (14266/19021)
Receiving objects:  76% (14456/19021)
Receiving objects:  77% (14647/19021)
Receiving objects:  78% (14837/19021)
Receiving objects:  79% (15027/19021)
Receiving objects:  80% (15217/19021)
Receiving objects:  81% (15408/19021)
Receiving objects:  82% (15598/19021)
Receiving objects:  83% (15788/19021)
Receiving objects:  84% (15978/19021)
Receiving objects:  85% (16168/19021)
Receiving objects:  86% (16359/19021)
Receiving objects:  87% (16549/19021)
Receiving objects:  88% (16739/19021)
Receiving objects:  89% (16929/19021)
Receiving objects:  90% (17119/19021)
Receiving objects:  91% (17310/19021)
Receiving objects:  92% (17500/19021)
Receiving objects:  93% (17690/19021)
Receiving objects:  94% (17880/19021)
Receiving objects:  95% (18070/19021)
Receiving objects:  96% (18261/19021)
Receiving objects:  97% (18451/19021)
remote: Total 19021 (delta 14457), reused 14694 (delta 10737)        
Receiving objects:  98% (18641/19021)
Receiving objects:  99% (18831/19021)
Receiving objects: 100% (19021/19021), 3.46 MiB | 7.22 MiB/s, done.
Resolving deltas:   0% (0/14457)
Resolving deltas:   1% (145/14457)
Resolving deltas:   2% (290/14457)
Resolving deltas:   3% (435/14457)
Resolving deltas:   4% (579/14457)
Resolving deltas:   5% (724/14457)
Resolving deltas:   6% (869/14457)
Resolving deltas:   7% (1012/14457)
Resolving deltas:   8% (1157/14457)
Resolving deltas:   9% (1302/14457)
Resolving deltas:  10% (1453/14457)
Resolving deltas:  11% (1646/14457)
Resolving deltas:  12% (1768/14457)
Resolving deltas:  13% (1974/14457)
Resolving deltas:  14% (2026/14457)
Resolving deltas:  15% (2170/14457)
Resolving deltas:  16% (2348/14457)
Resolving deltas:  17% (2553/14457)
Resolving deltas:  19% (2850/14457)
Resolving deltas:  20% (2897/14457)
Resolving deltas:  21% (3085/14457)
Resolving deltas:  22% (3190/14457)
Resolving deltas:  23% (3393/14457)
Resolving deltas:  24% (3492/14457)
Resolving deltas:  25% (3619/14457)
Resolving deltas:  26% (3763/14457)
Resolving deltas:  27% (3911/14457)
Resolving deltas:  28% (4126/14457)
Resolving deltas:  30% (4341/14457)
Resolving deltas:  31% (4513/14457)
Resolving deltas:  33% (4773/14457)
Resolving deltas:  34% (4984/14457)
Resolving deltas:  35% (5109/14457)
Resolving deltas:  36% (5330/14457)
Resolving deltas:  37% (5473/14457)
Resolving deltas:  38% (5506/14457)
Resolving deltas:  40% (5817/14457)
Resolving deltas:  41% (5982/14457)
Resolving deltas:  43% (6257/14457)
Resolving deltas:  44% (6370/14457)
Resolving deltas:  45% (6511/14457)
Resolving deltas:  46% (6658/14457)
Resolving deltas:  47% (6821/14457)
Resolving deltas:  48% (6975/14457)
Resolving deltas:  49% (7095/14457)
Resolving deltas:  50% (7370/14457)
Resolving deltas:  51% (7411/14457)
Resolving deltas:  52% (7557/14457)
Resolving deltas:  53% (7672/14457)
Resolving deltas:  54% (7807/14457)
Resolving deltas:  55% (7955/14457)
Resolving deltas:  56% (8106/14457)
Resolving deltas:  57% (8267/14457)
Resolving deltas:  58% (8388/14457)
Resolving deltas:  59% (8547/14457)
Resolving deltas:  60% (8711/14457)
Resolving deltas:  61% (8825/14457)
Resolving deltas:  62% (8982/14457)
Resolving deltas:  63% (9217/14457)
Resolving deltas:  64% (9296/14457)
Resolving deltas:  65% (9405/14457)
Resolving deltas:  66% (9559/14457)
Resolving deltas:  67% (9689/14457)
Resolving deltas:  68% (9837/14457)
Resolving deltas:  69% (9981/14457)
Resolving deltas:  70% (10160/14457)
Resolving deltas:  71% (10270/14457)
Resolving deltas:  72% (10438/14457)
Resolving deltas:  73% (10556/14457)
Resolving deltas:  74% (10712/14457)
Resolving deltas:  75% (10872/14457)
Resolving deltas:  76% (11005/14457)
Resolving deltas:  77% (11172/14457)
Resolving deltas:  78% (11282/14457)
Resolving deltas:  79% (11482/14457)
Resolving deltas:  80% (11566/14457)
Resolving deltas:  81% (11721/14457)
Resolving deltas:  82% (11901/14457)
Resolving deltas:  83% (12069/14457)
Resolving deltas:  84% (12172/14457)
Resolving deltas:  85% (12343/14457)
Resolving deltas:  86% (12480/14457)
Resolving deltas:  87% (12589/14457)
Resolving deltas:  88% (12751/14457)
Resolving deltas:  89% (12878/14457)
Resolving deltas:  90% (13014/14457)
Resolving deltas:  93% (13455/14457)
Resolving deltas:  94% (13595/14457)
Resolving deltas:  95% (13738/14457)
Resolving deltas:  96% (13891/14457)
Resolving deltas:  97% (14122/14457)
Resolving deltas:  98% (14201/14457)
Resolving deltas:  99% (14315/14457)
Resolving deltas: 100% (14457/14457)
Resolving deltas: 100% (14457/14457), done.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/lttng-modules
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/lttng-modules/lttng-modules_2.12.6.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============0157728888832763143==--
