Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id B3E2379F90
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Nov 2018 16:17:48 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id e11so623343itl.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Nov 2018 09:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6of7qAYoZpmBKGrPTsni77ZguGgDIMWDxyKWzA9ZGGc=;
	b=ijVE7dF4QOe61ENz7ulso3dc1ix0EuU7DRugyo821lGaWosavR5/JlSgekddFgauId
	SVUePX69miXHfYz/csubAZ3l9tZtwlL276/wbQDaywcrAlE4cH+55J0DPoXEC3f0XOJT
	81cP+OV0XqP0o3/f4PDggYYxgk8kDDSCyE2+gs+zMOHX2ZCKsHHo5EQq0dK7wMcWHi65
	EtMIIdvA+HY3/EP4zyhJP6FlqlQIsgDGBfCGrgZeEK4eoVhpZkzQyf37TqmE73Jc6aXi
	UqoQriAyHHowlWm1QrKR3zUmGiqFklRFIvAhWbGtszuNDvZggrNatGS6AfIOaBx9W8je
	cIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6of7qAYoZpmBKGrPTsni77ZguGgDIMWDxyKWzA9ZGGc=;
	b=AJWdh2rt6mqnrdDuSDuTRZBZNGXn9Z3t/mbNuCd7dSv0LcQ5sEHBCdTnzuhsn56Sdx
	A46v74r7LZvRZkazPK7r7LGkOphsM65jZ8iCq4glqtue2aYB565v0uj3i2CaKiiWC9Iz
	1sLWPhQ25egbzmHY+7uaeRcGPEFqcdYDueA3yQx40ZrJLO7yx2XsUgS+iaO8zpiKNg+w
	YwObALbXXY4m2fn5h7VEALpzVmoNaN3gm00De6QgbKVsvFB3mYh2R+hrZaBSdRwmz5PZ
	yRBrvjlXHFOVA75gSHDqB2S+gseJiBf2SWyqFddqD+bcZeWt7SxfLUWw96kyuv7ODvIn
	wCVw==
X-Gm-Message-State: AGRZ1gI+a/5kntXird+7PBwMa13JSi009Lh1fdQB8pDqDUkLdRAO+iY2
	sKqTDCh3wEfC82tVGjIjlm5Wkti4+sNP/eADSXujcA==
X-Google-Smtp-Source: AJdET5ccL4oVISivn5QDPGH0ixzgRst8YsjA6xLWQOGkqe9rZiAo9ekCshHYjU8mSgzP7tm3X++159kyXv3DjlZlZzA=
X-Received: by 2002:a24:9287:: with SMTP id
	l129-v6mr352452itd.26.1541175469539; 
	Fri, 02 Nov 2018 09:17:49 -0700 (PDT)
MIME-Version: 1.0
References: <20181031144648.28277-1-sno@netbsd.org>
	<CAJTo0LYJrmBh1_3AXZXH7xBY1KSCG_9buGfsqtG-D2MLRb=Qmg@mail.gmail.com>
	<9750133E-11F8-4833-9CBF-DB7B6998E3AE@netbsd.org>
	<CAJTo0LYqMLLp9T89CvR0jzSLuiHH7w2M2rrdoE0z-tS54ity9Q@mail.gmail.com>
In-Reply-To: <CAJTo0LYqMLLp9T89CvR0jzSLuiHH7w2M2rrdoE0z-tS54ity9Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 2 Nov 2018 16:17:38 +0000
Message-ID: <CAJTo0LaoWMZBv0_o8b1MYLq=CnFQFbOgCn2ptpqH0BeGCmN+RQ@mail.gmail.com>
To: Jens Rehsack <sno@netbsd.org>
Cc: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v8] python3{,-native}: update to 3.7.0
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
X-List-Received-Date: Fri, 02 Nov 2018 16:17:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 2 Nov 2018 at 16:09, Burton, Ross <ross.burton@intel.com> wrote:
> I'm currently running the regression tests so will report back if
> anything fails.

Turns out enabling reproducible builds breaks the test suite:

test test_py_compile failed -- Traceback (most recent call last):
  File "/usr/lib/python3.7/test/test_py_compile.py", line 125, in
test_source_date_epoch
    self.assertEqual(statinfo.st_mtime, testtime)
AssertionError: 1541175127.6495416 != 123456789
0:11:47 load avg: 0.41 [269/415/1] test_pyclbr -- test_py_compile failed

And this used to work before the upgrade but doesn't now:

test test_sysconfig failed -- Traceback (most recent call last):
  File "/usr/lib/python3.7/test/test_sysconfig.py", line 410, in
test_get_makefile_filename
    self.assertTrue(os.path.isfile(makefile), makefile)
AssertionError: False is not true :
/usr/lib/python3.7/config-3.7m-x86_64-linux-gnu/Makefile

I suspect we just need to make it skip, or depend on python3-dev.

test test_venv crashed -- Traceback (most recent call last):
  File "/usr/lib/python3.7/test/libregrtest/runtest.py", line 163, in
runtest_inner
    the_module = importlib.import_module(abstest)
  File "/usr/lib/python3.7/importlib/__init__.py", line 127, in import_module
    return _bootstrap._gcd_import(name[level:], package, level)
  File "<frozen importlib._bootstrap>", line 1006, in _gcd_import
  File "<frozen importlib._bootstrap>", line 983, in _find_and_load
  File "<frozen importlib._bootstrap>", line 967, in _find_and_load_unlocked
  File "<frozen importlib._bootstrap>", line 677, in _load_unlocked
  File "<frozen importlib._bootstrap_external>", line 728, in exec_module
  File "<frozen importlib._bootstrap>", line 219, in _call_with_frames_removed
  File "/usr/lib/python3.7/test/test_venv.py", line 20, in <module>
    import venv
ModuleNotFoundError: No module named 'venv'

Urgh, venv.  We just changed this, I wonder if it's not being pulled
into the python3-modules depends.

Ross

