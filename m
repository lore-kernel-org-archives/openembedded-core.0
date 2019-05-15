Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail.openembedded.org (Postfix) with ESMTP id AFB897DEF2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 19:43:13 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id w144so660372oie.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 12:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iC5ALgbuKRiwcMpPy6hYfRlCqQ6RcUJI0UJSlsVxujM=;
	b=Ix+nhKtJo5HiuNg6sqhaj6myusQi15dwO7ouOogDNkxP8aBkV4eXO+I7xqqQ6JuAWz
	Wt5PE8uWKwKgfQEQhzOaGGpRpe3ZYmHrECzaw7P5PtGzVs9aNHsIbujAvyZYQECdmiey
	NkeUFDYlT8tbXttWA+R6O2mnWVv+jK4voos4jrcag9zWweyNsn8aR4dk++HnonF7RFbY
	jy4QiuBh/T22Y4UZurp7DwcVIWmAtOmaO0Mz3DMZ5XzB4w0XF8To/WfgO6zwX8fT2Wc8
	JCiuGEa5AChM5I+FzQaZuMh3qaNUe1imCS5qp+KCL5Pm1PSKhTwpSYyfOo8E7p7VkOMa
	NHnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iC5ALgbuKRiwcMpPy6hYfRlCqQ6RcUJI0UJSlsVxujM=;
	b=c0owqwbEbFdUYdiTOsOYFV6BvJwyxHSxXgLm5GDZVYU/3/jS9qY7xa1xnrxuTp0HFF
	Oi02WCM1rHHRPTNerJGjlNrVsHyscnVkY0xfJjwYuKz6xv7qxQaplU0lstJqncvZZx/9
	UYRFYNWWZPaaAI/7nMHSzNnDVW3fdMDrrt/y7ScKfkBTsITA7MG9DfJcYtNj9VU/9TIH
	/c/sd7jlmF56wfeSW97JsGxnACxyrfKkVcIu7R7rJrNN30dP36DEfQZLqta8EelR+ipQ
	voh1wtRkqLFFWuQOocPHjqYNgEo8wzkEcegzW75MPvzf1yXHiY7Ztj1o/jNsa/BzVtqE
	1PAQ==
X-Gm-Message-State: APjAAAUd+qLDO8Lala5abKtazoqCHmbOaxPODzPj7SCD4JPkEBenQkyU
	7WpMXuRe+G+wQcr+4jJV87Y6qTDB+ztD/1QHFfI=
X-Google-Smtp-Source: APXvYqwoGDB4S+9fs4Ymxl3SV6QxM5XITr4eFZLxGlw/tdw8ODGzIGZn84iKIEcn2ddFocBcVO18LSTfzejSQt8ZZas=
X-Received: by 2002:aca:dfc4:: with SMTP id w187mr7720354oig.70.1557949394628; 
	Wed, 15 May 2019 12:43:14 -0700 (PDT)
MIME-Version: 1.0
References: <1557888470-57934-1-git-send-email-ee.peng.yeoh@intel.com>
In-Reply-To: <1557888470-57934-1-git-send-email-ee.peng.yeoh@intel.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 15 May 2019 21:43:02 +0200
Message-ID: <CANNYZj_kU12GxGk8Mi2gOyPNuQVyRbe+9BzCpxvOYKdJ3UEKMQ@mail.gmail.com>
To: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] oeqa/runtime/cases/rpm.py: Enable rpm install dependency testing
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
X-List-Received-Date: Wed, 15 May 2019 19:43:13 -0000
Content-Type: text/plain; charset="UTF-8"

This needs the same condition guard as other rpm tests, e.g.

@OETestDepends(['rpm.RpmBasicTest.test_rpm_query'])

should be enough.

Alex

On Wed, 15 May 2019 at 04:48, Yeoh Ee Peng <ee.peng.yeoh@intel.com> wrote:
>
> Convert manual testcase bsps-hw.bsps-hw.rpm_-__install_dependency_package
> from oeqa/manual/bsp-hw.json to runtime automated test.
>
> Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
> ---
>  meta/lib/oeqa/runtime/cases/rpm.py | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/meta/lib/oeqa/runtime/cases/rpm.py b/meta/lib/oeqa/runtime/cases/rpm.py
> index d8cabd3..fe1b489 100644
> --- a/meta/lib/oeqa/runtime/cases/rpm.py
> +++ b/meta/lib/oeqa/runtime/cases/rpm.py
> @@ -135,3 +135,32 @@ class RpmInstallRemoveTest(OERuntimeTestCase):
>          # Check that there's enough of them
>          self.assertGreaterEqual(int(output), 80,
>                                     'Cound not find sufficient amount of rpm entries in /var/log/messages, found {} entries'.format(output))
> +
> +    def test_rpm_install_dependency(self):
> +        rpmdir = os.path.join(self.tc.td['DEPLOY_DIR'], 'rpm', 'noarch')
> +        rpm_tests = {'run-postinsts-dev': '', 'run-postinsts': ''}
> +        rpm_pattern = 'run-postinsts-*.noarch.rpm'
> +        for f in fnmatch.filter(os.listdir(rpmdir), rpm_pattern):
> +            if 'run-postinsts-dev' not in f and 'run-postinsts-dbg' not in f:
> +                rpm_tests['run-postinsts'] = f
> +                continue
> +            if 'run-postinsts-dev' in f:
> +                rpm_tests['run-postinsts-dev'] = f
> +                continue
> +        rpm_dest_dir = '/tmp'
> +        for rpm in rpm_tests:
> +            self.tc.target.copyTo(os.path.join(rpmdir, rpm_tests[rpm]), os.path.join(rpm_dest_dir, rpm_tests[rpm]))
> +        # remove existing rpm before testing install with dependency
> +        self.tc.target.run('rpm -e %s' % 'run-postinsts-dev')
> +        self.tc.target.run('rpm -e %s' % 'run-postinsts')
> +        status, output = self.tc.target.run('rpm -ivh %s' % os.path.join(rpm_dest_dir, rpm_tests['run-postinsts-dev']))
> +        self.assertTrue(status == 1, 'rpm installed should have failed but it was getting %s' % status)
> +        self.assertTrue('error: Failed dependencies:' in output,
> +                        'rpm installed should have failed with error but it was getting: %s' % output)
> +        # reinstall rpm with dependency
> +        status, output = self.tc.target.run('rpm -ivh %s' % os.path.join(rpm_dest_dir, rpm_tests['run-postinsts']))
> +        self.assertTrue(status == 0, 'rpm (%s) installed with error: %s (%s)' % (rpm_tests['run-postinsts'], status, output))
> +        status, output = self.tc.target.run('rpm -ivh %s' % os.path.join(rpm_dest_dir, rpm_tests['run-postinsts-dev']))
> +        self.assertTrue(status == 0, 'rpm (%s) installed with error: %s (%s)' % (rpm_tests['run-postinsts-dev'], status, output))
> +        for rpm in rpm_tests:
> +            self.tc.target.run('rm -f %s' % os.path.join(rpm_dest_dir, rpm_tests[rpm]))
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

