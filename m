Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71075C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 06:08:52 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web08.28926.1654495729408076840
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jun 2022 23:08:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@zhukoff.net header.s=fm2
 header.b=jLBvRadg;
 spf=pass (domain: zhukoff.net, ip: 64.147.123.25,
 mailfrom: pavel@zhukoff.net)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 55A473200909;
	Mon,  6 Jun 2022 02:08:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 06 Jun 2022 02:08:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1654495724; x=1654582124; bh=Cd
	abP8aTGtf7OW6kiwz6IyUkKJcx/YQPUEzshRaCNjY=; b=jLBvRadgrexaWlFP9N
	bcblP8YHZrFB+zzeRyn+OEU2lwSNq3mki5hqNDciT61FAavzV//HiowX4eZM2UAN
	VWW7CTsxkS9qoOGpq01kxrluxBmNONm8wRbtQNVy17VhfuWRBbmDmaFdNPkV7zpa
	NgPA6TucsXCJ+29MwZKY5HIAZJCxklHDa/BXeKCy0FhyAIqDWn5e6vzANqGWQt0m
	wP0BR6u3ffMotGlcfI3ab6K2pA36Wx+UNOMBw3uELghUqPZbRwn9N/6MBvD6w4KS
	9LiQnSCh5RfdVTHF/vPtHB1xmqjVNgg8HzoDgRaf9lj411tirg1rFU+uRket94RD
	7WoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1654495724; x=1654582124; bh=CdabP8aTGtf7O
	W6kiwz6IyUkKJcx/YQPUEzshRaCNjY=; b=SuHSEM8MezoncZ0cFg+zYhhFqC8vT
	Ou/573tHUElxW4FqSbXvRcFNHmaPCFCkvA7oM1lO9PsOlvmOJ4j3nxVxi4chznqM
	i5IQZgotfAMZlT8oG4gIjF0H732YqRjndFvfQa//ZrLhLHUF41KdOWwxm99BZ0Rd
	ij0OEewzdeVCX1l1/Sky3ET/OUjIZ+YjZGpOmiljdfKfU8FjV0T1EypXku+EOKAI
	1vFh3HB6hvxa8RxDtsLNq05hqm43xMAFZK1iVFSgrQ71A/Ri7h9zj4swC/4tfRaM
	/XPs2ir8GqAg/p6CoWtcirl4+q1fbAknW74PROUSCZ3dyKHMVSocsE3XA==
X-ME-Sender: <xms:7JmdYtSJ9MZ6XuadUG3HbksGntxI0a1hgu51KELuXxMmWN9LF4bN2g>
    <xme:7JmdYmxDWZl_arvZ7yFJPHz65mQkH9ZtVdKuummNG11r7YVL1I55AgbLnne7xE8on
    uKYDDDQdRcfkhunSXc>
X-ME-Received: 
 <xmr:7JmdYi0VhUSyTQ5WcMbj7OpFbeAioPE0r8b2l5NR2DZIwCjmrLugKqbE9BUkHTGT_A1XPuo>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedruddtuddguddtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpehffgfhvfevufffrhgjkfggtgesthdtredttdertdenucfhrhhomheprfgr
    vhgvlhcukghhuhhkohhvuceophgrvhgvlhesiihhuhhkohhffhdrnhgvtheqnecuggftrf
    grthhtvghrnhepvddtgfehfedtudekfeekvddtieduueehgfetudegheeuffegveeihedu
    jeelvddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epphgrvhgvlhesiihhuhhkohhffhdrnhgvth
X-ME-Proxy: <xmx:7JmdYlDeD45-trAUPkKIp4GoHwvBsJSWhudemg23xMsa4rlktq94mA>
    <xmx:7JmdYmhMgUyfaCSgFl6OCH9PuU_6v7V__yMz5ZSXfrdhABrnyi9vBg>
    <xmx:7JmdYpqUed7ztw3zteuYTHdH5U3o6C-45KPr-Irsk2_CH6OyfdiY-g>
    <xmx:7JmdYpt-8opc7txilN04DXaXC13ofhwETcixAQDeZ7e_j5uDiqjOhw>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Jun 2022 02:08:43 -0400 (EDT)
References: <20220603085827.2214734-1-rybczynska@gmail.com>
User-agent: mu4e 1.6.10; emacs 28.1
From: Pavel Zhukov <pavel@zhukoff.net>
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: ernstp@gmail.com, Marta Rybczynska <marta.rybczynska@huawei.com>,
 openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] cve-check: move update_symlinks to a library
Date: Mon, 06 Jun 2022 08:03:37 +0200
Reply-To: pavel@zhukoff.net
In-reply-to: <20220603085827.2214734-1-rybczynska@gmail.com>
Message-ID: <87k09u2ujv.fsf@gentoo.zhukoff.net>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 06:08:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166585


Looks like update_symplinks is widely used accros OE. Quick grepping gave me this:
[1]. I'm sure there're more occurences. 
This should be somewhere in more accesible place (oe-core libraries).


[1] 
meta/lib/oeqa/runexported.py:            os.remove(sshloglink)
meta/lib/oeqa/runexported.py-        os.symlink(self.sshlog, sshloglink)
--
meta/lib/oeqa/selftest/context.py:                os.remove(output_link)
meta/lib/oeqa/selftest/context.py-            os.symlink(args.output_log, output_link)
--
meta/lib/oeqa/runtime/cases/ltp.py:            os.remove(cls.ltptest_log_dir_link)
meta/lib/oeqa/runtime/cases/ltp.py-        os.symlink(os.path.basename(cls.ltptest_log_dir), cls.ltptest_log_dir_link)
--
meta/lib/oeqa/runtime/cases/ptest.py:            os.remove(ptest_log_dir_link)
meta/lib/oeqa/runtime/cases/ptest.py-        os.symlink(os.path.basename(ptest_log_dir), ptest_log_dir_link)
--
meta/lib/oeqa/utils/decorators.py:            os.remove(linkfile)
meta/lib/oeqa/utils/decorators.py-        os.symlink(logfile, linkfile)
--
meta/lib/oeqa/core/context.py:            os.remove(output_link)
meta/lib/oeqa/core/context.py-        os.symlink(args.output_log, output_link)
--
meta/classes/baremetal-image.bbclass:            os.remove(manifest_link)
meta/classes/baremetal-image.bbclass-        os.symlink(os.path.basename(manifest_name), manifest_link)
--
meta/classes/qemuboot.bbclass:           os.remove(qemuboot_link)
meta/classes/qemuboot.bbclass-        os.symlink(os.path.basename(qemuboot), qemuboot_link)
--
meta/classes/cve-check.bbclass:            os.remove(link_path)
meta/classes/cve-check.bbclass-        os.symlink(os.path.basename(target_path), link_path)
--
meta/classes/rootfs-postcommands.bbclass:                os.remove(manifest_link)
meta/classes/rootfs-postcommands.bbclass-            os.symlink(os.path.basename(manifest_name), manifest_link)
--
meta/classes/rootfs-postcommands.bbclass:                os.remove(testdata_link)
meta/classes/rootfs-postcommands.bbclass-            os.symlink(os.path.basename(testdata_name), testdata_link)

"Marta Rybczynska" <rybczynska@gmail.com> writes:

> Move the function to a library, it could be useful in other places.
>
> Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
> ---
>  meta/classes/cve-check.bbclass | 11 +++--------
>  meta/lib/oe/cve_check.py       | 10 ++++++++++
>  2 files changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
> index c5c22c4c51..5eb0622d00 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -80,16 +80,10 @@ CVE_CHECK_LAYER_INCLUDELIST ??= ""
>  # set to "alphabetical" for version using single alphabetical character as increment release
>  CVE_VERSION_SUFFIX ??= ""
>  
> -def update_symlinks(target_path, link_path):
> -    if link_path != target_path and os.path.exists(target_path):
> -        if os.path.exists(os.path.realpath(link_path)):
> -            os.remove(link_path)
> -        os.symlink(os.path.basename(target_path), link_path)
> -
>  def generate_json_report(d, out_path, link_path):
>      if os.path.exists(d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")):
>          import json
> -        from oe.cve_check import cve_check_merge_jsons
> +        from oe.cve_check import cve_check_merge_jsons, update_symlinks
>  
>          bb.note("Generating JSON CVE summary")
>          index_file = d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")
> @@ -110,6 +104,7 @@ def generate_json_report(d, out_path, link_path):
>  python cve_save_summary_handler () {
>      import shutil
>      import datetime
> +    from oe.cve_check import update_symlinks
>  
>      cve_tmp_file = d.getVar("CVE_CHECK_TMP_FILE")
>  
> @@ -179,7 +174,7 @@ python cve_check_write_rootfs_manifest () {
>      import shutil
>      import json
>      from oe.rootfs import image_list_installed_packages
> -    from oe.cve_check import cve_check_merge_jsons
> +    from oe.cve_check import cve_check_merge_jsons, update_symlinks
>  
>      if d.getVar("CVE_CHECK_COPY_FILES") == "1":
>          deploy_file = d.getVar("CVE_CHECK_RECIPE_FILE")
> diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
> index dc7d2e2826..aa06497727 100644
> --- a/meta/lib/oe/cve_check.py
> +++ b/meta/lib/oe/cve_check.py
> @@ -163,3 +163,13 @@ def cve_check_merge_jsons(output, data):
>              return
>  
>      output["package"].append(data["package"][0])
> +
> +def update_symlinks(target_path, link_path):
> +    """
> +    Update a symbolic link link_path to point to target_path.
> +    Remove the link and recreate it if exist and is different.
> +    """
> +    if link_path != target_path and os.path.exists(target_path):
> +        if os.path.exists(os.path.realpath(link_path)):
> +            os.remove(link_path)
> +        os.symlink(os.path.basename(target_path), link_path)


