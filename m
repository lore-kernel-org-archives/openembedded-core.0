Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3DA6C745B7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Oct 2018 05:09:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9Q59RQg026862
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2018 22:09:27 -0700 (PDT)
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Thu, 25 Oct 2018 22:09:26 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1540433856-322582-1-git-send-email-changqing.li@windriver.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <97b21f4d-4f40-27eb-6126-4427877b7980@windriver.com>
Date: Fri, 26 Oct 2018 13:09:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1540433856-322582-1-git-send-email-changqing.li@windriver.com>
X-Originating-IP: [128.224.162.228]
Subject: Re: [PATCH] git: upgrade 2.18.0 -> 2.18.1
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
X-List-Received-Date: Fri, 26 Oct 2018 05:09:26 -0000
Content-Type: multipart/alternative;
	boundary="------------442B8614E48FFA484DF97BDC"
Content-Language: en-US

--------------442B8614E48FFA484DF97BDC
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

This upgrade is for fix CVE-17456

Here is the whole release note for 2.18.1

Git v2.18.1 Release Notes

	=========================

	

	This release merges up the fixes that appear in v2.14.5 and in

	v2.17.2 to address the recently reported CVE-2018-17456; see the

	release notes for those versions for details.


On 10/25/18 10:17 AM, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   meta/recipes-devtools/git/git_2.18.0.bb | 11 -----------
>   meta/recipes-devtools/git/git_2.18.1.bb | 11 +++++++++++
>   2 files changed, 11 insertions(+), 11 deletions(-)
>   delete mode 100644 meta/recipes-devtools/git/git_2.18.0.bb
>   create mode 100644 meta/recipes-devtools/git/git_2.18.1.bb
>
> diff --git a/meta/recipes-devtools/git/git_2.18.0.bb b/meta/recipes-devtools/git/git_2.18.0.bb
> deleted file mode 100644
> index 72b43a7..0000000
> --- a/meta/recipes-devtools/git/git_2.18.0.bb
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -require git.inc
> -
> -EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
> -                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
> -                 "
> -EXTRA_OEMAKE += "NO_GETTEXT=1"
> -
> -SRC_URI[tarball.md5sum] = "3f210b2dd1613d90ded3b8732b052025"
> -SRC_URI[tarball.sha256sum] = "94faf2c0b02a7920b0b46f4961d8e9cad08e81418614102898a55f980fa3e7e4"
> -SRC_URI[manpages.md5sum] = "8251512320568a049192a8219c51e905"
> -SRC_URI[manpages.sha256sum] = "6cf38ab3ad43ccdcd6a73ffdcf2a016d56ab6b4b240a574b0bb96f520a04ff55"
> diff --git a/meta/recipes-devtools/git/git_2.18.1.bb b/meta/recipes-devtools/git/git_2.18.1.bb
> new file mode 100644
> index 0000000..b2960c0
> --- /dev/null
> +++ b/meta/recipes-devtools/git/git_2.18.1.bb
> @@ -0,0 +1,11 @@
> +require git.inc
> +
> +EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
> +                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
> +                 "
> +EXTRA_OEMAKE += "NO_GETTEXT=1"
> +
> +SRC_URI[tarball.md5sum] = "9b62c267d878f6cb02f8abc59a99525d"
> +SRC_URI[tarball.sha256sum] = "5c710c866d8c9ba3b3e062755e0e9d0ef4f665752bd64810e3eb9f1b0f0eb076"
> +SRC_URI[manpages.md5sum] = "ef32a459a4a08a3b8e837a31c925c848"
> +SRC_URI[manpages.sha256sum] = "d05bfab2dc45de4f6e7d61ca173071d6902905a4963f7ac3cbca608c0d4592c9"

-- 
BRs

Sandy(Li Changqing)
Wind River Linux


--------------442B8614E48FFA484DF97BDC
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>This upgrade is for fix CVE-17456</p>
    <p>Here is the whole release note for 2.18.1</p>
    <table class="highlight tab-size js-file-line-container"
      data-tab-size="8" style="box-sizing: border-box; border-spacing:
      0px; border-collapse: collapse; tab-size: 8; color: rgb(36, 41,
      46); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe
      UI&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color
      Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI
      Symbol&quot;; font-size: 14px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      start; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; background-color: rgb(255, 255, 255); text-decoration-style:
      initial; text-decoration-color: initial;">
      <tbody style="box-sizing: border-box;">
        <tr style="box-sizing: border-box;">
          <td id="LC1" class="blob-code blob-code-inner js-file-line" style="box-sizing: border-box; padding: 0px 10px; position: relative; line-height: 20px; vertical-align: top; overflow: visible; font-family: SFMono-Regular, Consolas, &quot;Liberation Mono&quot;, Menlo, Courier, monospace; font-size: 12px; color: rgb(36, 41, 46); overflow-wrap: normal; white-space: pre;">Git v2.18.1 Release Notes</td>
        </tr>
        <tr style="box-sizing: border-box;">
          <td id="L2" class="blob-num js-line-number"
            data-line-number="2" style="box-sizing: border-box; padding:
            0px 10px; width: 50px; min-width: 50px; font-family:
            SFMono-Regular, Consolas, &quot;Liberation Mono&quot;,
            Menlo, Courier, monospace; font-size: 12px; line-height:
            20px; color: rgba(27, 31, 35, 0.3); text-align: right;
            white-space: nowrap; vertical-align: top; cursor: pointer;
            user-select: none;"><br>
          </td>
          <td id="LC2" class="blob-code blob-code-inner js-file-line" style="box-sizing: border-box; padding: 0px 10px; position: relative; line-height: 20px; vertical-align: top; overflow: visible; font-family: SFMono-Regular, Consolas, &quot;Liberation Mono&quot;, Menlo, Courier, monospace; font-size: 12px; color: rgb(36, 41, 46); overflow-wrap: normal; white-space: pre;">=========================</td>
        </tr>
        <tr style="box-sizing: border-box;">
          <td id="L3" class="blob-num js-line-number"
            data-line-number="3" style="box-sizing: border-box; padding:
            0px 10px; width: 50px; min-width: 50px; font-family:
            SFMono-Regular, Consolas, &quot;Liberation Mono&quot;,
            Menlo, Courier, monospace; font-size: 12px; line-height:
            20px; color: rgba(27, 31, 35, 0.3); text-align: right;
            white-space: nowrap; vertical-align: top; cursor: pointer;
            user-select: none;"><br>
          </td>
          <td id="LC3" class="blob-code blob-code-inner js-file-line" style="box-sizing: border-box; padding: 0px 10px; position: relative; line-height: 20px; vertical-align: top; overflow: visible; font-family: SFMono-Regular, Consolas, &quot;Liberation Mono&quot;, Menlo, Courier, monospace; font-size: 12px; color: rgb(36, 41, 46); overflow-wrap: normal; white-space: pre;">
</td>
        </tr>
        <tr style="box-sizing: border-box;">
          <td id="L4" class="blob-num js-line-number"
            data-line-number="4" style="box-sizing: border-box; padding:
            0px 10px; width: 50px; min-width: 50px; font-family:
            SFMono-Regular, Consolas, &quot;Liberation Mono&quot;,
            Menlo, Courier, monospace; font-size: 12px; line-height:
            20px; color: rgba(27, 31, 35, 0.3); text-align: right;
            white-space: nowrap; vertical-align: top; cursor: pointer;
            user-select: none;"><br>
          </td>
          <td id="LC4" class="blob-code blob-code-inner js-file-line" style="box-sizing: border-box; padding: 0px 10px; position: relative; line-height: 20px; vertical-align: top; overflow: visible; font-family: SFMono-Regular, Consolas, &quot;Liberation Mono&quot;, Menlo, Courier, monospace; font-size: 12px; color: rgb(36, 41, 46); overflow-wrap: normal; white-space: pre;">This release merges up the fixes that appear in v2.14.5 and in</td>
        </tr>
        <tr style="box-sizing: border-box;">
          <td id="L5" class="blob-num js-line-number"
            data-line-number="5" style="box-sizing: border-box; padding:
            0px 10px; width: 50px; min-width: 50px; font-family:
            SFMono-Regular, Consolas, &quot;Liberation Mono&quot;,
            Menlo, Courier, monospace; font-size: 12px; line-height:
            20px; color: rgba(27, 31, 35, 0.3); text-align: right;
            white-space: nowrap; vertical-align: top; cursor: pointer;
            user-select: none;"><br>
          </td>
          <td id="LC5" class="blob-code blob-code-inner js-file-line" style="box-sizing: border-box; padding: 0px 10px; position: relative; line-height: 20px; vertical-align: top; overflow: visible; font-family: SFMono-Regular, Consolas, &quot;Liberation Mono&quot;, Menlo, Courier, monospace; font-size: 12px; color: rgb(36, 41, 46); overflow-wrap: normal; white-space: pre;">v2.17.2 to address the recently reported CVE-2018-17456; see the</td>
        </tr>
        <tr style="box-sizing: border-box;">
          <td id="L6" class="blob-num js-line-number"
            data-line-number="6" style="box-sizing: border-box; padding:
            0px 10px; width: 50px; min-width: 50px; font-family:
            SFMono-Regular, Consolas, &quot;Liberation Mono&quot;,
            Menlo, Courier, monospace; font-size: 12px; line-height:
            20px; color: rgba(27, 31, 35, 0.3); text-align: right;
            white-space: nowrap; vertical-align: top; cursor: pointer;
            user-select: none;"><br>
          </td>
          <td id="LC6" class="blob-code blob-code-inner js-file-line" style="box-sizing: border-box; padding: 0px 10px; position: relative; line-height: 20px; vertical-align: top; overflow: visible; font-family: SFMono-Regular, Consolas, &quot;Liberation Mono&quot;, Menlo, Courier, monospace; font-size: 12px; color: rgb(36, 41, 46); overflow-wrap: normal; white-space: pre;">release notes for those versions for details.
</td>
        </tr>
      </tbody>
    </table>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 10/25/18 10:17 AM,
      <a class="moz-txt-link-abbreviated" href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a> wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1540433856-322582-1-git-send-email-changqing.li@windriver.com">
      <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 meta/recipes-devtools/git/git_2.18.0.bb | 11 -----------
 meta/recipes-devtools/git/git_2.18.1.bb | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-devtools/git/git_2.18.0.bb
 create mode 100644 meta/recipes-devtools/git/git_2.18.1.bb

diff --git a/meta/recipes-devtools/git/git_2.18.0.bb b/meta/recipes-devtools/git/git_2.18.0.bb
deleted file mode 100644
index 72b43a7..0000000
--- a/meta/recipes-devtools/git/git_2.18.0.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require git.inc
-
-EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
-                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-                 "
-EXTRA_OEMAKE += "NO_GETTEXT=1"
-
-SRC_URI[tarball.md5sum] = "3f210b2dd1613d90ded3b8732b052025"
-SRC_URI[tarball.sha256sum] = "94faf2c0b02a7920b0b46f4961d8e9cad08e81418614102898a55f980fa3e7e4"
-SRC_URI[manpages.md5sum] = "8251512320568a049192a8219c51e905"
-SRC_URI[manpages.sha256sum] = "6cf38ab3ad43ccdcd6a73ffdcf2a016d56ab6b4b240a574b0bb96f520a04ff55"
diff --git a/meta/recipes-devtools/git/git_2.18.1.bb b/meta/recipes-devtools/git/git_2.18.1.bb
new file mode 100644
index 0000000..b2960c0
--- /dev/null
+++ b/meta/recipes-devtools/git/git_2.18.1.bb
@@ -0,0 +1,11 @@
+require git.inc
+
+EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
+                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
+                 "
+EXTRA_OEMAKE += "NO_GETTEXT=1"
+
+SRC_URI[tarball.md5sum] = "9b62c267d878f6cb02f8abc59a99525d"
+SRC_URI[tarball.sha256sum] = "5c710c866d8c9ba3b3e062755e0e9d0ef4f665752bd64810e3eb9f1b0f0eb076"
+SRC_URI[manpages.md5sum] = "ef32a459a4a08a3b8e837a31c925c848"
+SRC_URI[manpages.sha256sum] = "d05bfab2dc45de4f6e7d61ca173071d6902905a4963f7ac3cbca608c0d4592c9"
</pre>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
BRs

Sandy(Li Changqing)
Wind River Linux</pre>
  </body>
</html>

--------------442B8614E48FFA484DF97BDC--
