Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0C1187742E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 01:53:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uBM1rMof012838
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 Dec 2016 17:53:22 -0800 (PST)
Received: from [128.224.162.168] (128.224.162.168) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Wed, 21 Dec 2016 17:53:21 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <1482308378-15213-1-git-send-email-mingli.yu@windriver.com>
	<CAJTo0LYT4YrWxex7mOLhBsWqKR_9cmJgO66dxzCoJT-U6kWDqQ@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <585B31E8.60704@windriver.com>
Date: Thu, 22 Dec 2016 09:52:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYT4YrWxex7mOLhBsWqKR_9cmJgO66dxzCoJT-U6kWDqQ@mail.gmail.com>
X-Originating-IP: [128.224.162.168]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gpgme: add GPGME_STATUS_KEY_CONSIDERED
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
X-List-Received-Date: Thu, 22 Dec 2016 01:53:26 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2016年12月21日 19:14, Burton, Ross wrote:
>
> On 21 December 2016 at 08:19, <mingli.yu@windriver.com
> <mailto:mingli.yu@windriver.com>> wrote:
>
>     From: Mingli Yu <Mingli.Yu@windriver.com
>     <mailto:Mingli.Yu@windriver.com>>
>
>     * src/gpgme.h.in <http://gpgme.h.in> (GPGME_STATUS_KEY_CONSIDERED): New.
>     * src/status-table.c (KEY_CONSIDERED): New.
>     * src/op-support.c (_gpgme_parse_inv_recp): Add argc KC_FPR and
>        KC_FLAGS.  Use calloc.
>        (_gpgme_parse_key_considered): New.
>     * src/sign.c (op_data_t): Add fields KC_FPR and KC_FLAGS.
>        (release_op_data): Free KC_FPR.
>        (_gpgme_sign_status_handler): Handle STATUS_KEY_CONSIDERED.
>     * src/encrypt.c (op_data_t): Add fields KC_FPR and KC_FLAGS.
>        (release_op_data): Free KC_FPR.
>        (_gpgme_encrypt_status_handler): Handle STATUS_KEY_CONSIDERED.
>
>     Reference:
>     https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gpgme.git;a=commitdiff;h=315fb73d4a774e2c699ac1804f5377559b4d0027
>     <https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gpgme.git;a=commitdiff;h=315fb73d4a774e2c699ac1804f5377559b4d0027>
>
>
> Can you explain *why* we should cherry pick a patch from upstream?

Thanks Ross!
The reason why I cherry pick this patch as there are three failed ptest 
cases as below for python-pygpgme which depends on gpgme.
FAIL: test_edit_ownertrust (tests.test_editkey.EditKeyTestCase)
FAIL: test_edit_quit (tests.test_editkey.EditKeyTestCase)
FAIL: test_edit_sign (tests.test_editkey.EditKeyTestCase)

And also found the solution from 
https://pagure.io/pygpgme/c/f14699792622715c9cec372400f9dc38f1122f63?branch=master 
to fix the failed ptest cases for python-pygpgme, and this solution for 
python-pygpgme also needs we update accordingly for gpgme.

Thanks,
Mingli

>
> Ross

