Return-Path: <philip.balister@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6FD126011C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Oct 2019 23:07:36 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id y144so4096285qkb.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Oct 2019 16:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=31aq+tD1UEoDmNMx3iqnE+0841AG5vLq7q90hEN5bbU=;
	b=tyQZ6jgaxF5Dv0jdrOR0BIuXM9BO4H9yTLRuYArGkTCez+QitA6QU32TSi96zFxjqX
	jBzVUwwvgKypgouBhkJiKDh/ruSPM6GQflAHgX1vdQFIGygGq3gA3Q8W0fb1bWIw9Lde
	CuCHigO0DG5RH9YLjnguradTGCvulmKbtM0jlLsTSGBcJ/1aU5gQAVM6zD66WsDuiWtA
	K/A/FZR6ijfBwOrECHHtrYwO5Ya6tY34FIefhxKbEKBEFyoYLtc21R+VCsIW2QRBzVnM
	TfeDWmkENqk74CE9KDhAwh89/f7cm9Aznq1+4POxD373VlkY4240P9+ww1lQm2LsvloQ
	68oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=31aq+tD1UEoDmNMx3iqnE+0841AG5vLq7q90hEN5bbU=;
	b=uaXzerQWq41XmYE3OgDsNe6xRnLGs1j9Sn2SCySx/YG5KiTBpF0T/ANP8rJuD/EV0m
	sFH8pWK8tbdNYntAGHCu1L7C15p+//xpcMOw7sEvlGCAGBzbS1MfdS11lvH6Yqyt77mR
	NGXYjncQZ70OI1lSXlQtSrCTOlpuDdCqb0L1lUMTmGtLejhUJRbMckaNAGaDXuHf9gNA
	NcNL9q/MEhO0o3rMs2Jcs+OKkV25a7rVIoGQOPFMWkH2WEH0V768kukX6DIdWMy2fmDv
	F/L7XSgryu6rIgb7F2drC66tpev+q6LCGk7354Cepik/HISQxgGuEGNlg++5gHEnptbF
	M+YA==
X-Gm-Message-State: APjAAAUcXZ99jDfh+2y57d+quHU4owM4VEYqNwsHIWIGhOhYS62LRxzA
	QJFNuN8QmI/OXLWmWIihWDvX4ELhIR0=
X-Google-Smtp-Source: APXvYqxdSUE6SyLeCrE5ikbm1z8LXFhOGBZAOSc4fgKeawT3+YfZ2YDYNMZoUqH9OaZzbeEVu4+X8g==
X-Received: by 2002:a37:8cc3:: with SMTP id o186mr7212623qkd.186.1570144056674;
	Thu, 03 Oct 2019 16:07:36 -0700 (PDT)
Received: from localhost.localdomain ([2601:5c0:c100:b84:c22d:c40:ab44:9e37])
	by smtp.gmail.com with ESMTPSA id
	z72sm2579038qka.115.2019.10.03.16.07.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 03 Oct 2019 16:07:35 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Oct 2019 19:07:10 -0400
Message-Id: <20191003230710.6247-1-philip@balister.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] oe.svg: Copy artwork from openembedded-classic.
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
X-List-Received-Date: Thu, 03 Oct 2019 23:07:36 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Philip Balister <philip@balister.org>
---
 contrib/artwork/oe.svg | 80 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 contrib/artwork/oe.svg

diff --git a/contrib/artwork/oe.svg b/contrib/artwork/oe.svg
new file mode 100644
index 0000000000..4af9587094
--- /dev/null
+++ b/contrib/artwork/oe.svg
@@ -0,0 +1,80 @@
+<?xml version="1.0" encoding="utf-8"?>
+<!-- Generator: Adobe Illustrator 13.0.2, SVG Export Plug-In . SVG Version: 6.00 Build 14948)  -->
+<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
+<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
+	 width="209.104px" height="167.858px" viewBox="0 0 209.104 167.858" enable-background="new 0 0 209.104 167.858"
+	 xml:space="preserve">
+<g>
+	<g>
+		<path fill="#00BCE4" d="M74.145,145.897c-0.568,0.568-0.841,1.228-0.841,2.03v0.339h5.744v-0.339c0-1.601-1.273-2.87-2.872-2.872
+			C75.372,145.056,74.713,145.33,74.145,145.897z M73.304,154.262c0,0.876,0.729,1.605,1.605,1.605h6.334
+			c1.357,0,2.195,0.838,2.195,2.194c0,1.357-0.838,2.195-2.195,2.195h-6.334c-1.657,0-3.101-0.58-4.265-1.73
+			c-1.15-1.163-1.731-2.607-1.731-4.265v-6.334c0-4.041,3.221-7.261,7.262-7.263c2.019,0,3.752,0.705,5.148,2.115
+			c1.41,1.396,2.114,3.13,2.114,5.147v4.729H73.304V154.262z"/>
+		<path fill="#00BCE4" d="M99.738,140.665c1.662,0,3.094,0.584,4.246,1.75c1.166,1.153,1.749,2.584,1.75,4.246v11.4
+			c0,1.357-0.838,2.195-2.195,2.195s-2.195-0.838-2.195-2.195v-11.4c0-0.922-0.684-1.604-1.605-1.605h-1.604v13.006
+			c0,1.357-0.838,2.195-2.195,2.195s-2.195-0.838-2.195-2.195v-13.006h-3.21v13.006c0,1.357-0.838,2.195-2.195,2.195
+			s-2.195-0.838-2.195-2.195V142.86c0-1.357,0.838-2.195,2.195-2.195H99.738z"/>
+		<path fill="#00BCE4" d="M123.308,154.262c0,3.37-2.625,5.995-5.995,5.995h-6.334c-1.356,0-2.194-0.838-2.194-2.195V135.26
+			c0-1.356,0.838-2.195,2.194-2.195c1.357,0,2.195,0.839,2.195,2.195v5.405h4.139c3.472,0,5.993,2.658,5.995,5.995V154.262z
+			 M113.174,145.056v10.812h4.139c0.903,0,1.604-0.701,1.604-1.605v-7.601c0-0.927-0.678-1.604-1.605-1.605H113.174z"/>
+		<path fill="#00BCE4" d="M130.897,145.897c-0.568,0.568-0.842,1.228-0.842,2.03v0.339h5.744v-0.339c0-1.601-1.273-2.87-2.872-2.872
+			C132.124,145.056,131.466,145.33,130.897,145.897z M130.056,154.262c0,0.876,0.729,1.605,1.605,1.605h6.334
+			c1.357,0,2.195,0.838,2.195,2.194c0,1.357-0.838,2.195-2.195,2.195h-6.334c-1.657,0-3.102-0.58-4.266-1.73
+			c-1.148-1.163-1.73-2.607-1.73-4.265v-6.334c0-4.041,3.221-7.261,7.263-7.263c2.019,0,3.752,0.705,5.147,2.115
+			c1.41,1.396,2.115,3.13,2.115,5.147v4.729h-10.135V154.262z"/>
+		<path fill="#00BCE4" d="M143.688,143.646c1.129-1.972,2.906-2.98,5.201-2.981h4.139v-5.405c0-1.356,0.838-2.195,2.195-2.195
+			s2.195,0.839,2.195,2.195v22.802c0,1.357-0.838,2.195-2.195,2.195h-6.334c-1.657,0-3.102-0.58-4.266-1.73
+			c-1.149-1.163-1.73-2.607-1.73-4.265v-7.601C142.894,145.581,143.157,144.572,143.688,143.646z M147.741,145.532
+			c-0.307,0.309-0.457,0.665-0.457,1.129v7.601c0,0.878,0.727,1.605,1.605,1.605h4.139v-10.812h-4.139
+			C148.433,145.056,148.067,145.207,147.741,145.532z"/>
+		<path fill="#00BCE4" d="M160.917,143.646c1.129-1.972,2.905-2.98,5.201-2.981h4.139v-5.405c0-1.356,0.838-2.195,2.195-2.195
+			c1.356,0,2.195,0.839,2.195,2.195v22.802c0,1.357-0.839,2.195-2.195,2.195h-6.334c-1.657,0-3.102-0.58-4.266-1.73
+			c-1.149-1.163-1.73-2.607-1.73-4.265v-7.601C160.122,145.581,160.386,144.572,160.917,143.646z M164.97,145.532
+			c-0.308,0.309-0.457,0.665-0.457,1.129v7.601c0,0.878,0.727,1.605,1.605,1.605h4.139v-10.812h-4.139
+			C165.661,145.056,165.296,145.207,164.97,145.532z"/>
+		<path fill="#00BCE4" d="M182.583,145.897c-0.568,0.568-0.842,1.228-0.842,2.03v0.339h5.743l0.001-0.339
+			c0-1.601-1.273-2.87-2.873-2.872C183.81,145.056,183.15,145.33,182.583,145.897z M181.741,154.262
+			c0,0.876,0.729,1.605,1.605,1.605h6.333c1.357,0,2.195,0.838,2.195,2.194c0,1.357-0.838,2.195-2.195,2.195h-6.333
+			c-1.658,0-3.102-0.58-4.266-1.73c-1.149-1.163-1.73-2.607-1.73-4.265v-6.334c0-4.041,3.221-7.261,7.262-7.263
+			c2.019,0,3.752,0.705,5.148,2.115c1.41,1.396,2.114,3.13,2.114,5.147v4.729h-10.134V154.262z"/>
+		<path fill="#00BCE4" d="M195.374,143.646c1.129-1.972,2.905-2.98,5.2-2.981h4.139v-5.405c0-1.356,0.839-2.195,2.195-2.195
+			c1.357,0,2.195,0.839,2.195,2.195v22.802c0,1.357-0.838,2.195-2.195,2.195h-6.333c-1.658,0-3.102-0.58-4.266-1.73
+			c-1.149-1.163-1.73-2.607-1.73-4.265v-7.601C194.579,145.582,194.843,144.572,195.374,143.646z M199.427,145.532
+			c-0.308,0.309-0.457,0.665-0.457,1.129v7.601c0,0.878,0.727,1.605,1.605,1.605h4.138v-10.812h-4.138
+			C200.118,145.056,199.753,145.207,199.427,145.532z"/>
+	</g>
+	<g>
+		<path fill="#5C6F7B" d="M19.423,140.665h6.333c1.662,0,3.094,0.584,4.246,1.75c1.167,1.153,1.75,2.585,1.75,4.246v7.601
+			c0,1.651-0.587,3.082-1.748,4.244c-1.152,1.167-2.586,1.751-4.248,1.751h-4.138v5.406c0,1.357-0.838,2.195-2.195,2.195
+			s-2.195-0.839-2.195-2.195V142.86C17.228,141.503,18.066,140.665,19.423,140.665z M21.619,155.867h4.138
+			c0.903,0,1.605-0.701,1.605-1.605v-7.601c0-0.928-0.679-1.604-1.605-1.605h-4.138V155.867z"/>
+		<path fill="#5C6F7B" d="M39.688,145.897c-0.569,0.568-0.841,1.228-0.841,2.03v0.339h5.743v-0.339c0-1.601-1.272-2.87-2.872-2.872
+			C40.915,145.056,40.256,145.33,39.688,145.897z M38.847,154.262c0,0.876,0.729,1.605,1.605,1.605h6.333
+			c1.357,0,2.195,0.838,2.195,2.194c0,1.357-0.838,2.195-2.195,2.195h-6.333c-1.657,0-3.101-0.58-4.265-1.73
+			c-1.15-1.163-1.73-2.607-1.73-4.265v-6.334c0-4.041,3.22-7.261,7.262-7.263c2.018,0,3.752,0.705,5.147,2.115
+			c1.411,1.396,2.115,3.13,2.115,5.147v4.729H38.847V154.262z"/>
+		<path fill="#5C6F7B" d="M51.685,142.86c0-1.357,0.838-2.195,2.195-2.195h6.334c1.662,0,3.094,0.584,4.246,1.75
+			c1.167,1.153,1.749,2.584,1.75,4.246v11.4c0,1.357-0.838,2.195-2.195,2.195s-2.195-0.838-2.195-2.195v-11.4
+			c0-0.922-0.684-1.604-1.605-1.605h-4.138v13.006c0,1.357-0.838,2.195-2.195,2.195c-1.357,0-2.195-0.838-2.195-2.195V142.86z"/>
+		<path fill-rule="evenodd" clip-rule="evenodd" fill="#5C6F7B" d="M10.134,147.928c0-1.601-1.273-2.87-2.872-2.872
+			c-1.599,0-2.872,1.273-2.872,2.872v5.067c0,0.824,0.267,1.485,0.822,2.049c0.564,0.555,1.226,0.823,2.05,0.823
+			c1.601,0,2.871-1.273,2.872-2.873V147.928z M0,147.928c0-4.041,3.22-7.261,7.262-7.263c2.019,0,3.752,0.705,5.148,2.115
+			c1.411,1.396,2.114,3.13,2.114,5.147v5.067c0,4.041-3.222,7.262-7.262,7.262c-1.997,0-3.732-0.713-5.147-2.114
+			C0.713,156.727,0,154.991,0,152.995V147.928z"/>
+	</g>
+	<g>
+		<path fill-rule="evenodd" clip-rule="evenodd" fill="#5C6F7B" d="M25.428,79.124C25.428,35.424,60.853,0,104.552,0
+			s79.123,35.424,79.123,79.124c0,14.938-4.139,28.909-11.333,40.828h-26.366c10.352-10.5,16.738-24.918,16.738-40.828
+			c0-32.123-26.039-58.163-58.162-58.163s-58.163,26.04-58.163,58.163c0,15.91,6.388,30.328,16.738,40.828H36.761
+			C29.568,108.032,25.428,94.062,25.428,79.124z"/>
+	</g>
+	<g>
+		<path fill="#00BCE4" d="M94.122,79.124c0-2.882,1.168-5.491,3.059-7.379l17.436-17.494c-9.682-3.913-21.184-1.944-29.033,5.905
+			c-10.476,10.476-10.476,27.461,0,37.937c10.476,10.477,27.461,10.477,37.938,0c4.547-4.547,7.12-10.321,7.721-16.256l18.46-18.461
+			c5.838,16.774,2.056,36.151-11.345,49.553c-18.67,18.67-48.939,18.67-67.609,0c-18.67-18.67-18.67-48.938,0-67.608
+			c18.669-18.67,48.939-18.67,67.609,0c2.535,2.536,4.728,5.287,6.574,8.193l-32.986,32.997c-1.888,1.89-4.511,3.045-7.393,3.045
+			C98.791,89.554,94.122,84.884,94.122,79.124z"/>
+	</g>
+</g>
+</svg>
-- 
2.20.1


