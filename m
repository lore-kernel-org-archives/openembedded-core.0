Return-Path: <sstncr@gmail.com>
Received: from mail-we0-f180.google.com (unknown [74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2606B65F20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 09:27:57 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id t61so5156561wes.39
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 02:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=1Pt76d71unvvLU6ocMMkzcvpSuGDP7F24JpT++BcIQo=;
	b=RAULQ3wdPEufo0fZsbaKKuiAg3G4eOjti7roV2K249q1PG3l1+VcGVPphxzwX0RHcj
	28Hv5Y1AjkQvabxpOW9caMEFrVMy+SJBgzlPW5CKCKSjZgwFswxGur7S8MxKGGRijyUz
	rA+jOEJPWEKlRLfCHRL8AGUnb6XnUgMjqviJuJhJGuS3jxT1de5Bfw8fokO0FQjtpVvv
	38UttyBu3qkrgW4aSIKVEMRDMCbzwrbVYwnHzoMbE65y6N5eeReR12+lbEzkaEvKgylV
	hzkwQxOQbcVqYofzsVkec4RV/dEBwNm9F+48nhkdmBdJCzD9HAx7NL5IWUpGvIT5On5D
	/bCQ==
MIME-Version: 1.0
X-Received: by 10.194.250.68 with SMTP id za4mr672962wjc.89.1400491678656;
	Mon, 19 May 2014 02:27:58 -0700 (PDT)
Received: by 10.216.48.6 with HTTP; Mon, 19 May 2014 02:27:58 -0700 (PDT)
In-Reply-To: <1400229891-5302-1-git-send-email-georgex.l.musat@intel.com>
References: <1400229891-5302-1-git-send-email-georgex.l.musat@intel.com>
Date: Mon, 19 May 2014 12:27:58 +0300
Message-ID: <CANr+NRu16-swsx2B1qCJU=H5dmqWwsbD=iD28LA76uTYg_E39A@mail.gmail.com>
From: Stefan Stanacar <sstncr@gmail.com>
To: Lucian Musat <georgex.l.musat@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PTACH V2] oeqa/runtime: Update test names with testopia tc numbers.
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
X-List-Received-Date: Mon, 19 May 2014 09:27:59 -0000
Content-Type: text/plain; charset=UTF-8

Hi Lucian,

On Fri, May 16, 2014 at 11:44 AM, Lucian Musat
<georgex.l.musat@intel.com> wrote:
>
>  class SmartRepoTest(SmartTest):
> @@ -54,11 +54,12 @@ class SmartRepoTest(SmartTest):
>      @classmethod
>      def tearDownClass(self):
>          self.repo_server.stop()
> +       smartsRepo = SmartRepoTest
>

Again, this line doesn't make sense and it probably shouldn't be here.

>  class SyslogTest(oeRuntimeTest):
>
> -    @skipUnlessPassed("test_ssh")
> -    def test_syslog_help(self):
> -        (status,output) = self.target.run('/sbin/syslogd --help')
> -        self.assertEqual(status, 0, msg="status and output: %s and %s" % (status,output))
> +    @skipUnlessPassed("test_ssh_tc_224")
> +    def test_syslog_help_tc_202(self):
> +               (status,output) = self.target.run('/sbin/syslogd --help')
> +               self.assertEqual(status, 0, msg="status and output: %s and %s" % (status,output))
>

There are some whitespaces/tabs added here that probably shouldn't be.

Please also add a description why this patch is needed. Why do we need
to add testopia numbers to test names, how is it useful?
Also, isn't there any other way we could map these tests to testopia testcases?

Cheers,
Stefan

