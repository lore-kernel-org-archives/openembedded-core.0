Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.83])
 by mx.groups.io with SMTP id smtpd.web10.19523.1605837843357203601
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2020 18:04:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=n1dO1Vvu;
 spf=pass (domain: windriver.com, ip: 40.107.94.83, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fvvcIVWpmwEsfcHyRbMkw/365HWeovlxrkLN31g2Nu714Wrynk7cMJDjfzEC0J4WFWq55DE5Amsh9AaetrePgnWbYxo4RQ6fNOdI5pj9h+0CIlJ7FxDjX/FuVGdiyt4ujCl3+K9225Mcf3KOhydAsTi85aC662b+TaxmhrPnQO0uoIZaMhoo4g89k46wdyxJIyM2amvkxDr1Tyt2lcJ/Os+R/QGT0uKUFgTDxu3SNI6tF4basLNNowT5kfOO6tXJIwxDaaWR1/u8t0/zC3XUFsYPTfFPlx9wpSQXgEXe9JCkaHRgBrQmd6CaALY4UHVsnfoOFckS+ccRvNLk8f1UKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zX+yEcxfK15nB6Bvm83D294M3v4fuozVX010nIMhLg=;
 b=ASi6TZl9wkmTNY/3uzvZYNNGTuU1AujQtrH5Opgz7u8VRaUNoCfRbPECNZxpSKyd4R+Ak+b6JqLeQn7Fsd95g4o7CqvXu7Mw0ZfPW4F1NZbdEu9VaQqAjqLSjVVGTJOA4cZICHVxKAHBjCe9odfWTjZIjmYUx3JlDwOAdR5jfjKmJN8pG7ijb5eSoKbRuo1ZJAsK8uYd9H3NK6jtr2cThW/SSnDvJna+sk/ry8bdKXkV7unOKVFm2BOaQ5fY30KneM4u+L4JI+rOXockW+lRnjHQNLxY2yOoS9XVBuodlgjbYzeMw/b8OiiXLBTz6WVIeG2USEEd6VhqSeIEeme0Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zX+yEcxfK15nB6Bvm83D294M3v4fuozVX010nIMhLg=;
 b=n1dO1Vvu3QSO/uSIwkcVfjxYGVaClcSRZRKA703yXEe71+HtVNueqH/k9HdojNqRnfTD796s7/yKNlIn91PZaNhPb/cV/paRgxRp0k817mG321mdv4+GdG1xORG3fDq2gnyjSu5eW6Xyw9SqgazuaSraHlZtaX4S87keKgHKnVA=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3292.namprd11.prod.outlook.com (2603:10b6:5:5a::21) by
 DM6PR11MB2601.namprd11.prod.outlook.com (2603:10b6:5:ce::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.22; Fri, 20 Nov 2020 02:04:02 +0000
Received: from DM6PR11MB3292.namprd11.prod.outlook.com
 ([fe80::fcf7:a1ca:17c2:f169]) by DM6PR11MB3292.namprd11.prod.outlook.com
 ([fe80::fcf7:a1ca:17c2:f169%7]) with mapi id 15.20.3589.024; Fri, 20 Nov 2020
 02:04:02 +0000
Subject: Re: [OE-core] [PATCH 1/2] systemd-systemctl: capable to call without argument
From: "kai" <kai.kang@windriver.com>
To: obi@opendreambox.org
Cc: openembedded-core@lists.openembedded.org
References: <20201102021757.32532-1-kai.kang@windriver.com>
 <16438F587D21D644.10137@lists.openembedded.org>
Message-ID: <61546dfe-1e08-7928-7549-9e82997588c0@windriver.com>
Date: Fri, 20 Nov 2020 10:03:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <16438F587D21D644.10137@lists.openembedded.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0015.apcprd03.prod.outlook.com
 (2603:1096:203:c8::20) To DM6PR11MB3292.namprd11.prod.outlook.com
 (2603:10b6:5:5a::21)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.141] (60.247.85.82) by HKAPR03CA0015.apcprd03.prod.outlook.com (2603:1096:203:c8::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.9 via Frontend Transport; Fri, 20 Nov 2020 02:04:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35aa3b95-1292-4a8a-ec98-08d88cf88d1a
X-MS-TrafficTypeDiagnostic: DM6PR11MB2601:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB2601FC69407243DA2745AB1F95FF0@DM6PR11MB2601.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CZ7Ybi/c/rE7LzHXptM53F6w0+Cdob8BMfRmPdxbk2wkgvxlancPdu8v2xXzB9G6ZyeVZnvM6nwxVPgS7wYBMDJQ0wVk8gzIs8n+Lh+zmhtiP9wthFAd1q6Si4Ko1YY9vHp6jXtdSNQa3TliUCD9EedXAIscmcvtpSDI5jeSR/PT6PwgCTLWt/enAxmWNe29rVL7Gyii4syPh3y7kCkal+thB4vgt9eeHUThjyO0tMXZ7MZoDcrKmpCMnDMBDC+TpV7EwgkgCZ+20VWsegTOUU7qlW7HFoihwG6sOFfX6DjFvAWiy9ClhQS5xdhoP7p32+hMcUGMBXk+KVUrrCmPlEhDqjdIejFoi/uYxlCZAqv9OYzlRssF2R8TeOkNHq19T7vqH+mPlLcwcMjBgV1bB7UtVDRet8d7bd4RsjXZAY2mNhkDF2WLZhhA6U2EgbbZS+oGz132LFBbN2AlGOcrFp0wq6g2FbaB+Zle+hQjBnQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3292.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39850400004)(376002)(346002)(366004)(31696002)(66476007)(66556008)(966005)(26005)(6706004)(186003)(6916009)(6666004)(66946007)(36756003)(316002)(5660300002)(2906002)(166002)(478600001)(31686004)(4326008)(2616005)(83380400001)(16576012)(16526019)(956004)(52116002)(86362001)(6486002)(33964004)(8936002)(53546011)(8676002)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	VFlpUPAMI21seUKPB3ban4IIMvwc4sUjOh57iZ5i2zz4s/EjPJLZWXpinp93DpFs4wdgoC7cNDS/3+TTa0grtDDsAczScccMmenVAn7dtNvxhhcqKyog/ziQe26JLVZ7FMfPQgOyVjm/g7i79pp29D7621GofyIoI3P4QrsHCuPRsRGP76l1gVijlPKmJ7c/LrhqAwhnyI90SLJDnfFWu7EOqCxltNEj1TVhoaNnVulf/PDL8xJZjdRy6577raD8Qu/f6yAurBa6sAY+aQsX8K7SS0qJ2WTV5lbULK4NwGDCZRgBcxqh+azkkGl/6lz0Ga0265fowVzfoVIsjVBJBApkOqq88X51/a5Rpwu7VrHoCrO9BHBnoGGKxoO3zY/1fABV6HYsPtjdqb7LAxav6YNGYFzzKI0rUCYDW65HNld3pv1HnOijcn8PMuIlu0JfzbqJBePAgahOh9n9T5gVviIMz9OzP1toRdKfQJ7BHxsd0d1zPXADhipU7T7Vo8WJ7vNWg7SMzNM6Q8XfQ2dxIMJBKBrbh+/5ukRf356yoD46CabvyT7oh5+7meMzVPpDpEOjlphap2yp1zUYI2yzt4Z/m/BAmcfZDhl/ZVVDfRa2g6SdRKTmmRc2v2hWY5BejjobmHZ/Jc+T12JROXysGQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35aa3b95-1292-4a8a-ec98-08d88cf88d1a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3292.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2020 02:04:02.1164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5HRfT/2kwECbjAeI7y1D09b3+MQ0TZhDX+/ed3W0BgEa7J9HigQe6hhvU+wOoiOCgyMldx0vgEaQllhlXUgNhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2601
Content-Type: multipart/alternative;
 boundary="------------A7CE45517B0A22D781A7486B"
Content-Language: en-US

--------------A7CE45517B0A22D781A7486B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Any comment, please?

Thanks,
Kai


On 11/2/20 10:17 AM, kai wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> Make systemctl prints help mesages if run without any argument. It helps
> to judge whether systemctl works in postscripts in systemd.bbclass.
>
> Remove trailing white spaces as well.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   meta/recipes-core/systemd/systemd-systemctl/systemctl | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
> index 990de1ab39..c692b65920 100755
> --- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
> +++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
> @@ -30,7 +30,7 @@ class SystemdFile():
>           self._parse(root, path)
>           dirname = os.path.basename(path.name) + ".d"
>           for location in locations:
> -            for path2 in sorted((root / location / "system" / dirname).glob("*.conf")):
> +            for path2 in sorted((root / location / "system" / dirname).glob("*.conf")):
>                   self._parse(root, path2)
>   
>       def _parse(self, root, path):
> @@ -282,7 +282,7 @@ def main():
>           sys.exit("Python 3.4 or greater is required")
>   
>       parser = argparse.ArgumentParser()
> -    parser.add_argument('command', nargs=1, choices=['enable', 'mask',
> +    parser.add_argument('command', nargs='?', choices=['enable', 'mask',
>                                                        'preset-all'])
>       parser.add_argument('service', nargs=argparse.REMAINDER)
>       parser.add_argument('--root')
> @@ -300,7 +300,11 @@ def main():
>           locations.append(BASE_LIBDIR / "systemd")
>       locations.append(LIBDIR / "systemd")
>   
> -    command = args.command[0]
> +    command = args.command
> +    if not command:
> +        parser.print_help()
> +        return 0
> +
>       if command == "mask":
>           for service in args.service:
>               SystemdUnit(root, service).mask()
>
> 
>


--------------A7CE45517B0A22D781A7486B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Any comment, please?</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Thanks,<br>
      Kai<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 11/2/20 10:17 AM, kai wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:16438F587D21D644.10137@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>

Make systemctl prints help mesages if run without any argument. It helps
to judge whether systemctl works in postscripts in systemd.bbclass.

Remove trailing white spaces as well.

Signed-off-by: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>
---
 meta/recipes-core/systemd/systemd-systemctl/systemctl | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index 990de1ab39..c692b65920 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -30,7 +30,7 @@ class SystemdFile():
         self._parse(root, path)
         dirname = os.path.basename(path.name) + &quot;.d&quot;
         for location in locations:
-            for path2 in sorted((root / location / &quot;system&quot; / dirname).glob(&quot;*.conf&quot;)):                
+            for path2 in sorted((root / location / &quot;system&quot; / dirname).glob(&quot;*.conf&quot;)):
                 self._parse(root, path2)
 
     def _parse(self, root, path):
@@ -282,7 +282,7 @@ def main():
         sys.exit(&quot;Python 3.4 or greater is required&quot;)
 
     parser = argparse.ArgumentParser()
-    parser.add_argument('command', nargs=1, choices=['enable', 'mask',
+    parser.add_argument('command', nargs='?', choices=['enable', 'mask',
                                                      'preset-all'])
     parser.add_argument('service', nargs=argparse.REMAINDER)
     parser.add_argument('--root')
@@ -300,7 +300,11 @@ def main():
         locations.append(BASE_LIBDIR / &quot;systemd&quot;)
     locations.append(LIBDIR / &quot;systemd&quot;)
 
-    command = args.command[0]
+    command = args.command
+    if not command:
+        parser.print_help()
+        return 0
+
     if command == &quot;mask&quot;:
         for service in args.service:
             SystemdUnit(root, service).mask()
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------A7CE45517B0A22D781A7486B--
